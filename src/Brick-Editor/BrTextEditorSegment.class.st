"
I represent a single text segment that is backed up by a sub text.
We split the whole text into segment in order to support infinite list that is used to render the whole text.

By default segment is a single line: a piece of text between new line characters
"
Class {
	#name : #BrTextEditorSegment,
	#superclass : #BrEditorSegment,
	#traits : 'TBrTextEditorTextualPiece',
	#classTraits : 'TBrTextEditorTextualPiece classTrait',
	#category : #'Brick-Editor-Model - Segment-Text'
}

{ #category : #printing }
BrTextEditorSegment >> gtDisplayOn: aStream [
	self printOn: aStream
]

{ #category : #initialization }
BrTextEditorSegment >> initializeWith: aBrText from: aTextStart to: aTextEnd [
	"Set a piece of text to be associated with this segment"

	self
		assert: [ aBrText isKindOf: BlSubText ]
		description: [ 'Must be sub-text' ].

	text := aBrText.

	textStart := aTextStart.
	textEnd := aTextEnd.

	self clearCache
]

{ #category : #'api - operations' }
BrTextEditorSegment >> insert: aCollectionOfSegments [
	| theSegments theRestLength |
	<return: #Collection of: #BrTextEditorSegment>

	theSegments := { self }, aCollectionOfSegments allButFirst.

	
	theRestLength := self textLength - (aCollectionOfSegments first textStart - textStart).

	"when inserting multiple segments we just need to alter intervals of the first (myself)
	and the last inserted segments accordingly"
	self
		scopeText: self textStart
		end: aCollectionOfSegments first textEnd.

	theSegments last
		scopeText: theSegments last textStart
		end: theSegments last textEnd + theRestLength.

	^ theSegments
]

{ #category : #testing }
BrTextEditorSegment >> isAllLineBreak [
	"Return true if segment only consists of line break, false otherwise"
	<return: #Boolean>
	
	^ self text allSatisfy: #isLineBreak
]

{ #category : #testing }
BrTextEditorSegment >> isLineBreak [
	"Return true if segment only consists of line break, false otherwise"
	<return: #Boolean>
	
	^ self text anySatisfy: #isLineBreak
]

{ #category : #'text - modifications' }
BrTextEditorSegment >> moveTextBy: aNumber [
	"Move all sub-text pieces (#start and #end) known by the segment by a given amount of indicies.
	If aNumber is negative sub-texts will be moved to the left (maybe this is a result of a deletion).
	If aNumber is positive sub-texts will be moved to the right (maybe this is a result of an insertion).
	aNumber must not be zero - undefined behaviour (nothing was inserted but the message is sent? Probably a bug)"

	self start: textStart + aNumber end: textEnd + aNumber
]

{ #category : #printing }
BrTextEditorSegment >> printOn: aStream [
	self text printOn: aStream
]
