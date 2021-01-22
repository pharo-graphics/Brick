"
!Event handler attribute
Is the superclass of all attributes with the ability to handle some text events received by the visual text elements.
"
Class {
	#name : #BrTextEventHandlerAttribute,
	#superclass : #BlTextAttribute,
	#category : #'Brick-Editor-Attributes'
}

{ #category : #events }
BrTextEventHandlerAttribute >> handleEvent: anEvent in: aTextEditor on: aTBrTextEditorTextualPiece [
	self subclassResponsibility
]

{ #category : #testing }
BrTextEventHandlerAttribute >> isEventHandler [
	"Return true if attribute is designed to handle UI events such as mouse,
	false otherwise"
	<return: #Boolean>

	^ true
]

{ #category : #comparing }
BrTextEventHandlerAttribute >> type [
	^ self
]

{ #category : #events }
BrTextEventHandlerAttribute >> wantsEvent: anEvent in: aTextEditor [
	"Return true if I am interested in a given event and want to handle it,
	false otherwise"
	<return: #Boolean>

	^ self subclassResponsibility
]
