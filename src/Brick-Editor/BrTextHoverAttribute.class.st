Class {
	#name : #BrTextHoverAttribute,
	#superclass : #BrTextEventHandlerAttribute,
	#instVars : [
		'enterAction',
		'leaveAction'
	],
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #accessing }
BrTextHoverAttribute >> enterAction [
	^ enterAction
]

{ #category : #accessing }
BrTextHoverAttribute >> enterAction: anObject [
	enterAction := anObject
]

{ #category : #events }
BrTextHoverAttribute >> handleEvent: anEvent in: anEditorElement [
	"Handle a given event or dispatch it using #sendTo:"

	(anEvent isKindOf: BlMouseEnterEvent)
		ifTrue: [ self performEnterAction: anEvent in: anEditorElement ].

	(anEvent isKindOf: BlMouseLeaveEvent)
		ifTrue: [ self performLeaveAction: anEvent in: anEditorElement ].
]

{ #category : #initialization }
BrTextHoverAttribute >> initialize [
	super initialize.

	enterAction := [ :aText :aTextElement :anEditorElement :anEvent | ].
	leaveAction := [ :aText :aTextElement :anEditorElement :anEvent | ]
]

{ #category : #accessing }
BrTextHoverAttribute >> leaveAction [
	^ leaveAction
]

{ #category : #accessing }
BrTextHoverAttribute >> leaveAction: aBlock [
	self 
		assert: [ aBlock notNil ] 
		description: [ 'Leave action should be initialized' ].

	leaveAction := aBlock
]

{ #category : #private }
BrTextHoverAttribute >> performEnterAction: anEvent in: anEditorElement [
	self enterAction glamourValueWithArgs: {
		anEvent currentTarget text. "first we pass text"
		anEvent currentTarget. "then the text piece (word) element"
		anEditorElement. "then the whole editor element"
		anEvent "the event itself"
	}
]

{ #category : #private }
BrTextHoverAttribute >> performLeaveAction: anEvent in: anEditorElement [
	self leaveAction glamourValueWithArgs: {
		anEvent currentTarget text. "first we pass text"
		anEvent currentTarget. "then the text piece (word) element"
		anEditorElement. "then the whole editor element"
		anEvent "the event itself"
	}
]

{ #category : #events }
BrTextHoverAttribute >> wantsEvent: anEvent in: anEditorElement [
	"Return true if I am interested in a given event and want to handle it,
	false otherwise"
	<return: #Boolean>

	^ (anEvent isKindOf: BlMouseEnterEvent)
		or: [ anEvent isKindOf: BlMouseLeaveEvent ]
]
