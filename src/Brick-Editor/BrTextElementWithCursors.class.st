"
I am extended version of the ${class:BlTextElement}$ with support of multiple cursors.
"
Class {
	#name : #BrTextElementWithCursors,
	#superclass : #BlTextElement,
	#instVars : [
		'cursorElements',
		'cursorStencil'
	],
	#category : #'Brick-Editor-UI'
}

{ #category : #'cursor - management' }
BrTextElementWithCursors >> addCursorAt: aTextPosition [
	<return: #BrCursorElement>
	
	self assertCursorPosition: aTextPosition.
	
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

{ #category : #'cursor - management' }
BrTextElementWithCursors >> cursorScreenPositionAt: aTextIndex [
	<return: #Point>
	| aScreenPosition |
	
	aScreenPosition := self paragraph positionAt: aTextIndex.
	^ aScreenPosition x @ (self height / 2.0)
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
		
		self assertCursor: aCursorElement.
		aCursorPosition := aCursorElement textPosition.

		"cursor is not within paragraph"
		self paragraph measuredEnd < aCursorPosition
			ifTrue: [ ^ self ].

		aTextPosition := self cursorScreenPositionAt: aCursorPosition.
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
BrTextElementWithCursors >> showCursors [
	self cursorElements do: [ :aCursorElement | aCursorElement visibility: BlVisibility visible ]
]
