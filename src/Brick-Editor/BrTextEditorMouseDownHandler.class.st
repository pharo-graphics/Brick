"
I handle mouse down events and move or add a cursor at a corresponding position
"
Class {
	#name : #BrTextEditorMouseDownHandler,
	#superclass : #BlBasicEventHandler,
	#instVars : [
		'editorElement'
	],
	#category : #'Brick-Editor-UI - Handlers'
}

{ #category : #accessing }
BrTextEditorMouseDownHandler >> editorElement [
	^ editorElement
]

{ #category : #accessing }
BrTextEditorMouseDownHandler >> editorElement: anEditorElement [
	editorElement := anEditorElement
]

{ #category : #accessing }
BrTextEditorMouseDownHandler >> eventClass [
	^ BlMouseDownEvent
]

{ #category : #'api - event managing' }
BrTextEditorMouseDownHandler >> handleEvent: anEvent [
	| aNavigator aScreenPosition |
	
	anEvent consumed: true.
	aScreenPosition := (self editorElement localBoundsToMine: (BlBounds origin: anEvent localPosition extent: 0@0) fromChild: anEvent currentTarget) center.
	
	self editorElement editor deselecter all deselect.
	self editorElement requestFocus.
	
	aNavigator := self editorElement editor navigator.
	anEvent modifiers isPrimaryModifier
		ifTrue: [ aNavigator addAtScreenPosition: aScreenPosition ]
		ifFalse: [ aNavigator moveToScreenPosition: aScreenPosition ].
	aNavigator apply
]

{ #category : #'api - event managing' }
BrTextEditorMouseDownHandler >> wantsEvent: anEvent [
	^ anEvent class = self eventClass
]
