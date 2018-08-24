Class {
	#name : #BrTextEditorSingleCursor,
	#superclass : #BrTextEditorCursor,
	#instVars : [
		'position',
		'isVisible'
	],
	#category : 'Brick-Editor-Model - Cursor'
}

{ #category : #initialization }
BrTextEditorSingleCursor >> initialize [
	super initialize.
	
	"Default cursor position should be 0,
	which means that it will be before the first text item (character) if it exists"
	position := 0.
	isVisible := false
]

{ #category : #testing }
BrTextEditorSingleCursor >> insideSubText: aBrSubText of: aSegment [
	"Return true if I am inside a given subtext, false otherwise"
	<return: #Boolean>

	aBrSubText isEmpty
		ifTrue: [ ^ self position isZero ].

	self position isZero
		ifTrue: [ ^ aBrSubText start = 1 ].

	(aBrSubText = aSegment pieces first)
		ifTrue: [
			^ self position
				between: aBrSubText start - 1
				and: aBrSubText end ].

	^ self position
		between: aBrSubText start
		and: aBrSubText end
]

{ #category : #accessing }
BrTextEditorSingleCursor >> isVisible [
	"Return true if this cursor should be visible, false otherwise"
	<return: #Boolean>

	^ isVisible
]

{ #category : #accessing }
BrTextEditorSingleCursor >> isVisible: aBoolean [
	isVisible := aBoolean
]

{ #category : #accessing }
BrTextEditorSingleCursor >> position [
	"Return position of the cursor within the text"
	<return: #Number>

	^ position
]

{ #category : #accessing }
BrTextEditorSingleCursor >> position: anIndex [
	self
		assert: [ anIndex >= 0 ]
		description: [ 'Cursor position must not be negative' ].

	position := anIndex
]

{ #category : #printing }
BrTextEditorSingleCursor >> printOn: aStream [
	aStream
		nextPutAll: 'Cursor (';
		nextPutAll: self position asString;
		nextPutAll: ')'
]
