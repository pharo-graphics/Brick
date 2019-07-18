"
I handle mouse down events and move or add a cursor at a corresponding position
"
Class {
	#name : #BrTextEditorMouseDownHandler,
	#superclass : #BlBasicEventHandler,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Brick-Editor-UI - Handlers'
}

{ #category : #cleanup }
BrTextEditorMouseDownHandler class >> cleanUp [
	super cleanUp.
	
	uniqueInstance := nil
]

{ #category : #cleanup }
BrTextEditorMouseDownHandler class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #accessing }
BrTextEditorMouseDownHandler >> eventClass [
	^ BlMouseDownEvent
]

{ #category : #'api - event managing' }
BrTextEditorMouseDownHandler >> handleEvent: anEvent [
	| aNavigator aScreenPosition anEditorElement |
	
	"To not create an instance of me for each tiny text element"
	anEditorElement := anEvent currentTarget
		allParentsDetect: [ :anElement | anElement isKindOf: BrEditorElement ]
		ifFound: #yourself
		ifNone: [ ^ self ].
	
	anEvent consumed: true.
	aScreenPosition := (anEditorElement localBoundsToMine: (BlBounds origin: anEvent localPosition extent: 0@0) fromChild: anEvent currentTarget) center.
	
	anEditorElement editor deselecter all deselect.
	anEditorElement requestFocus.
	
	aNavigator := anEditorElement editor navigator.
	anEvent modifiers isPrimaryModifier
		ifTrue: [ aNavigator addAtScreenPosition: aScreenPosition ]
		ifFalse: [ aNavigator moveToScreenPosition: aScreenPosition ].
	aNavigator apply
]

{ #category : #'api - event managing' }
BrTextEditorMouseDownHandler >> wantsEvent: anEvent [
	^ anEvent class = self eventClass
]
