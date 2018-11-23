Class {
	#name : #BrTextEditorLineSegmentPiece,
	#superclass : #Object,
	#instVars : [
		'segment',
		'text',
		'textStart',
		'textEnd'
	],
	#category : #'Brick-Editor-Model - Segment-Text-Line'
}

{ #category : #comparing }
BrTextEditorLineSegmentPiece >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].
	
	^ anotherObject text = self text
]

{ #category : #'instance creation' }
BrTextEditorLineSegmentPiece >> createElement: anEditorElement [
	<return: #BlElement>

	^ self subclassResponsibility
]

{ #category : #accessing }
BrTextEditorLineSegmentPiece >> end [
	<return: #Number>

	^ textEnd
]

{ #category : #printing }
BrTextEditorLineSegmentPiece >> gtDisplayOn: aStream [
	self printOn: aStream
]

{ #category : #comparing }
BrTextEditorLineSegmentPiece >> hash [
	^ self class hash bitXor: self text hash
]

{ #category : #testing }
BrTextEditorLineSegmentPiece >> isEmpty [
	^ self text isEmpty
]

{ #category : #printing }
BrTextEditorLineSegmentPiece >> printOn: aStream [
	self text printOn: aStream
]

{ #category : #accessing }
BrTextEditorLineSegmentPiece >> segment [
	^ segment
]

{ #category : #accessing }
BrTextEditorLineSegmentPiece >> segment: anObject [
	segment := anObject
]

{ #category : #accessing }
BrTextEditorLineSegmentPiece >> start [
	<return: #Number>

	^ textStart
]

{ #category : #accessing }
BrTextEditorLineSegmentPiece >> start: aStartIndex end: anEndIndex [
	textStart := aStartIndex.
	textEnd := anEndIndex.

	text start: ((aStartIndex + 1) min: anEndIndex) end: anEndIndex
]

{ #category : #accessing }
BrTextEditorLineSegmentPiece >> text [
	<return: #BlSubText>

	^ text
]

{ #category : #accessing }
BrTextEditorLineSegmentPiece >> text: aBrSubText [
	text := aBrSubText.
	
	textStart := text textOffset.
	textEnd := textStart + text size
]

{ #category : #updating }
BrTextEditorLineSegmentPiece >> updateCursor: anElement of: aLineSegment in: anEditorElement [
	self subclassResponsibility
]

{ #category : #updating }
BrTextEditorLineSegmentPiece >> updateFocus: aBoolean of: aTextPieceElement in: anEditorElement [
	self subclassResponsibility
]

{ #category : #updating }
BrTextEditorLineSegmentPiece >> updateSelection: anElement of: aLineSegment in: anEditorElement [
	
	self subclassResponsibility
]

{ #category : #updating }
BrTextEditorLineSegmentPiece >> updateText: anElement of: aLineSegment in: anEditorElement [
	
	self subclassResponsibility
]
