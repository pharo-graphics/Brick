Class {
	#name : #BrTextEditorLineSegment,
	#superclass : #BrTextEditorSegment,
	#instVars : [
		'pieces'
	],
	#category : 'Brick-Editor-Model - Segment-Text-Line'
}

{ #category : #'pieces - computation' }
BrTextEditorLineSegment >> computedPieces [
	<return: #SequenceableCollection of: #BrTextEditorLineSegmentPiece>
	| thePieces |
	
	thePieces := Array streamContents: [ :aStream |
		| lineIterator |
		
		lineIterator := self text iterator.
		[ lineIterator hasNext ] whileTrue: [
			self nextSegmentPiece: lineIterator in: aStream ] ].

	^ thePieces
		ifEmpty:[ { self textPiece: (self text from: 0 to: 0) } ]
		ifNotEmpty: #yourself
]

{ #category : #testing }
BrTextEditorLineSegment >> hasPieces [
	^ pieces isNotNil
]

{ #category : #'pieces - computation' }
BrTextEditorLineSegment >> invalidate [
	"Clear all caches and make this segment fresh as if it would just be created and initalized"
	super invalidate.

	pieces := nil
]

{ #category : #'text - modifications' }
BrTextEditorLineSegment >> moveTextBy: aNumber [
	super moveTextBy: aNumber.

	"no pieces created (they were not requested yet so no need to move them)"
	self hasPieces
		ifFalse: [ ^ self ].

	self pieces
		do: [ :aTextPiece | aTextPiece start: aTextPiece start + aNumber end: aTextPiece end + aNumber ]
]

{ #category : #'pieces - computation' }
BrTextEditorLineSegment >> nextSegmentPiece: aBrTextIterator in: aStream [
	aStream nextPut: (self textPiece: aBrTextIterator nextWord)
]

{ #category : #accessing }
BrTextEditorLineSegment >> pieces [
	<return: #Array of: #BlSubText>

	^ self hasPieces
		ifTrue: [ pieces ]
		ifFalse: [ pieces := self computedPieces ]
]

{ #category : #accessing }
BrTextEditorLineSegment >> segmentType [
	"Return a type of this segment responsible for creation
	of segment holder and also used as a key for caching purposes"
	<return: #BrEditorSegmentType>
	
	^ BrTextEditorLineSegmentType uniqueInstance
]

{ #category : #'instance creation' }
BrTextEditorLineSegment >> textPiece: aText [
	"Create and return a text segment piece"
	<return: #BrTextEditorLineSegmentPiece>

	^ BrTextEditorLineSegmentTextPiece new text: aText
]
