"
I am an attribute with the ability to handle events received by a visual text element 
"
Class {
	#name : #BrTextEventHandlerAttribute,
	#superclass : #BlTextAttribute,
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #comparing }
BrTextEventHandlerAttribute >> equals: aTextAttribute [
	"Return true if I am equal to a given text attribute assuming that
	it has the same type as me"
	<return: #Boolean>

	^ self species = aTextAttribute species
]

{ #category : #events }
BrTextEventHandlerAttribute >> handleEvent: anEvent in: anEditorElement [
	"Handle a given event or dispatch it using #sendTo:"

	self subclassResponsibility
]

{ #category : #comparing }
BrTextEventHandlerAttribute >> hash [
	^ self identityHash
]

{ #category : #testing }
BrTextEventHandlerAttribute >> isEventHandler [
	"Return true if attribute is designed to handle UI events such as mouse,
	false otherwise"
	<return: #Boolean>

	^ true
]

{ #category : #events }
BrTextEventHandlerAttribute >> wantsEvent: anEvent in: anEditorElement [
	"Return true if I am interested in a given event and want to handle it,
	false otherwise"
	<return: #Boolean>

	^ self subclassResponsibility
]
