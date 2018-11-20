"
I represent a single text segment that is backed up by a sub text.
We split the whole text into segment in order to support infinite list that is used to render the whole text.

By default segment is a single line: a piece of text between new line characters.
"
Class {
	#name : #BrTextEditorSegment,
	#superclass : #BrEditorSegment,
	#instVars : [
		'text',
		'textStart',
		'textEnd'
	],
	#category : #'Brick-Editor-Model - Segment-Text'
}

{ #category : #printing }
BrTextEditorSegment >> gtDisplayOn: aStream [
	self printOn: aStream
]

{ #category : #initialization }
BrTextEditorSegment >> initializeWith: aBrSubText [
	"Initialize this segment with a given sub-text"

	text := aBrSubText.
	self invalidate
]

{ #category : #initialization }
BrTextEditorSegment >> initializeWith: aBrText from: aTextStart to: aTextEnd [
	"Set a piece of text to be associated with this segment"
	
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
		start: self textStart
		end: aCollectionOfSegments first textEnd.

	theSegments last
		start: theSegments last textStart
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
BrTextEditorSegment >> isEmpty [
	"Return true if my text is empty, false otherwise"
	<return: #Boolean>

	^ self text isEmpty
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

{ #category : #initialization }
BrTextEditorSegment >> start: aStartIndex end: anEndIndex [

	textStart := aStartIndex.
	textEnd := anEndIndex.

	text start: ((aStartIndex + 1) min: anEndIndex) end: anEndIndex
]

{ #category : #accessing }
BrTextEditorSegment >> text [
	"Return a sub-text that I represent"
	<return: #BlSubText>

	^ text
]

{ #category : #accessing }
BrTextEditorSegment >> textEnd [
	"Return an index of the last character of a subtext that I represent"
	<return: #Number>
	
	^ textEnd
]

{ #category : #accessing }
BrTextEditorSegment >> textInterval [
	"Return both #textStart and #textEnd in a form of Interval"
	<return: #Interval>
	
	^ self textStart to: self textEnd
]

{ #category : #accessing }
BrTextEditorSegment >> textLength [
	"Return an index of the last character of a subtext that I represent"
	<return: #Number>
	
	^ self textEnd - self textStart
]

{ #category : #accessing }
BrTextEditorSegment >> textStart [
	"Return an index of the first character of a subtext that I represent"
	<return: #Number>
	
	^ textStart
]
