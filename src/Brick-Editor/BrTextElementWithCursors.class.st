"
I am extended version of the ${class:BlTextElement}$ with support of multiple cursors.
"
Class {
	#name : #BrTextElementWithCursors,
	#superclass : #BlTextElement,
	#instVars : [
		'cursorElements',
		'cursorStencil',
		'segmentPiece'
	],
	#category : #'Brick-Editor-UI'
}

{ #category : #'cursor - management' }
BrTextElementWithCursors >> addCursorAt: aTextPosition [
	<return: #BrCursorElement>
	
	^ self
		cursorAt: aTextPosition
		ifFound: #yourself
		ifNone: [
			| aCursorElement |
			aCursorElement := self newCursor.
			aCursorElement textPosition: aTextPosition.
			cursorElements add: aCursorElement.
			self addChild: aCursorElement.
			aCursorElement ]
]

{ #category : #asserting }
BrTextElementWithCursors >> assertCursor: aCursorElement [
	self assertCursorPosition: aCursorElement textPosition
]

{ #category : #asserting }
BrTextElementWithCursors >> assertCursorPosition: anIndex [
	self
		assert: [ self text isNotEmpty or: [ anIndex isZero ] ]
		description: [ 'Cursor position can only be zero if text is empty' ].
	self
		assert: [ anIndex between: 0 and: self text size ]
		description: [ 'Cursor must be within text bounds (0 is allowed)' ].
]

{ #category : #private }
BrTextElementWithCursors >> cursorAt: aTextPosition ifFound: aFoundBlock ifNone: aNoneBlock [

	^ cursorElements
		detect: [ :aCursor | aCursor textPosition = aTextPosition ]
		ifFound: aFoundBlock
		ifNone: aNoneBlock
]

{ #category : #accessing }
BrTextElementWithCursors >> cursorElements [
	<return: #Collection of: #BrCursorElement>

	^ cursorElements
]

{ #category : #accessing }
BrTextElementWithCursors >> cursorStencil [
	^ cursorStencil
]

{ #category : #accessing }
BrTextElementWithCursors >> cursorStencil: aStencil [
	cursorStencil := aStencil
]

{ #category : #'geometry bounds' }
BrTextElementWithCursors >> focusedBounds: aBlBounds [
	"My focused bounds should be focused bounds of a cursor if it exists or my own otherwise"
	<return: #BlBounds>

	^ super focusedBounds: aBlBounds

	"^ (self cursorExists and: [ self hasFocus ])
		ifFalse: [ super focusedBounds: aBlBounds ]
		ifTrue: [ self cursorElement localBoundsToParent: (self cursorElement focusedBounds: aBlBounds) ]"
]

{ #category : #testing }
BrTextElementWithCursors >> hasCursorAt: aTextPosition [
	"Return true if cursor at a given position exists"
	<return: #Boolean>
		
	^ self
		cursorAt: aTextPosition
		ifFound: [ true ]
		ifNone: [ false ]
]

{ #category : #'cursor - management' }
BrTextElementWithCursors >> hideCursors [
	self cursorElements do: [ :aCursorElement | aCursorElement visibility: BlVisibility gone ]
]

{ #category : #initialization }
BrTextElementWithCursors >> initialize [
	super initialize.

	cursorElements := OrderedCollection new.
	cursorStencil := BrCursorStencil uniqueInstance
]

{ #category : #layout }
BrTextElementWithCursors >> measureCursors: anExtentMeasurementSpec [
	| aMaxCursorExtent |
	
	cursorElements do: [ :aCursorElement |
		| aCursorPosition aTextPosition |
		
		"we make sure that the cursor is within text bounds (we allow to add a cursor outside of the text bounds)"
		aCursorPosition := aCursorElement textPosition min: self text size max: 0.
		aTextPosition := self screenPositionAt: aCursorPosition.
		aTextPosition := (aTextPosition x - (aCursorElement measuredWidth // 2)) @ 0.
		aCursorElement measuredBounds position: aTextPosition ].

	aMaxCursorExtent := 0@0.
	cursorElements do: [ :aCursorElement | aMaxCursorExtent := aMaxCursorExtent max: aCursorElement measuredExtent ].
	self measuredExtent: (self measuredExtent max: aMaxCursorExtent)
]

{ #category : #initialization }
BrTextElementWithCursors >> newCursor [
	"Create and return a new instance of a cursor element"
	<return: #BlElement>

	^ self cursorStencil asElement
]

{ #category : #layout }
BrTextElementWithCursors >> onMeasure: anExtentMeasurementSpec [	
	super onMeasure: anExtentMeasurementSpec.
	
	self measureCursors: anExtentMeasurementSpec
]

{ #category : #printing }
BrTextElementWithCursors >> printOn: aStream [
	segmentPiece
		ifNil: [ ^ aStream nextPutAll: 'Uknown segment' ].
	
	aStream
		nextPut: $(;
		nextPutAll: segmentPiece textStart asString;
		nextPutAll: ' - ';
		nextPutAll: segmentPiece textEnd asString;
		nextPut: $);
		print: segmentPiece text
]

{ #category : #'cursor - management' }
BrTextElementWithCursors >> removeCursorAt: aTextIndex [
	"Remove cursor at a goven position"

	^ self
		cursorAt: aTextIndex
		ifFound: [ :aCursorElement |
			cursorElements remove: aCursorElement.
			aCursorElement removeFromParent.
			aCursorElement ]
		ifNone: [ self error: 'Cursor at ', aTextIndex asString, ' does not exist' ]
]

{ #category : #'cursor - management' }
BrTextElementWithCursors >> removeCursors [
	"Remove all cursors"

	self cursorElements reverseDo: [ :eachCursorElement | eachCursorElement removeFromParent ].
	self cursorElements removeAll
]

{ #category : #accessing }
BrTextElementWithCursors >> removeSegmentPiece [
	segmentPiece := nil.	
	self text: '' asRopedText
]

{ #category : #accessing }
BrTextElementWithCursors >> segmentPiece [
	<return: #TBrTextEditorTextualPiece>

	^ segmentPiece
]

{ #category : #accessing }
BrTextElementWithCursors >> segmentPiece: aSegmentPiece [
	
	segmentPiece := aSegmentPiece.
	(self text equals: aSegmentPiece text)
		ifFalse: [
			"('text changed {1}' format: { aSegmentPiece text }) traceCr."
			self text: (aSegmentPiece text copyFrom: 1 to: aSegmentPiece text size) ]
		ifTrue: [ "('text same {1}' format: { aSegmentPiece text }) traceCr. " ]
]

{ #category : #'cursor - management' }
BrTextElementWithCursors >> showCursors [
	self cursorElements do: [ :aCursorElement | aCursorElement visibility: BlVisibility visible ]
]

{ #category : #'text - accessing' }
BrTextElementWithCursors >> textEnd [
	"Return an index of the last character of a subtext that I represent"
	<return: #Number>
	
	^ segmentPiece textEnd
]

{ #category : #'text - accessing' }
BrTextElementWithCursors >> textStart [
	"Return an index of the first character of a subtext that I represent"
	<return: #Number>
	
	^ segmentPiece textStart
]
