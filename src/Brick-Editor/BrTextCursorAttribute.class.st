Class {
	#name : #BrTextCursorAttribute,
	#superclass : #BrTextEventHandlerAttribute,
	#instVars : [
		'enterAction',
		'leaveAction',
		'isInside'
	],
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #accessing }
BrTextCursorAttribute >> enterAction [
	^ enterAction
]

{ #category : #accessing }
BrTextCursorAttribute >> enterAction: anObject [
	enterAction := anObject
]

{ #category : #events }
BrTextCursorAttribute >> handleEvent: anEvent in: aTextEditor on: aTBrTextEditorTextualPiece [
	"Handle a given event or dispatch it using #sendTo:"

	(anEvent isKindOf: BrTextEditorCursorAddedEvent)
		ifTrue: [ self performEnterAction: anEvent in: aTextEditor ].

	(anEvent isKindOf: BrTextEditorCursorRemovedEvent)
		ifTrue: [ self performLeaveAction: anEvent in: aTextEditor ].
]

{ #category : #initialization }
BrTextCursorAttribute >> initialize [
	super initialize.

	enterAction := [ :aTextEditor :anEvent | ].
	leaveAction := [ :aTextEditor :anEvent | ].
	isInside := false
]

{ #category : #accessing }
BrTextCursorAttribute >> leaveAction [
	^ leaveAction
]

{ #category : #accessing }
BrTextCursorAttribute >> leaveAction: aBlock [
	self 
		assert: [ aBlock notNil ] 
		description: [ 'Leave action should be initialized' ].

	leaveAction := aBlock
]

{ #category : #private }
BrTextCursorAttribute >> performEnterAction: anEvent in: aTextEditor [

	isInside
		ifTrue: [ ^ self ].
		
	isInside := true.

	self enterAction glamourValueWithArgs: {
		aTextEditor. "then the whole editor element"
		anEvent "the event itself"
	}
]

{ #category : #private }
BrTextCursorAttribute >> performLeaveAction: anEvent in: aTextEditor [
	
	isInside
		ifFalse: [ ^ self ].
		
	isInside := false.

	self leaveAction glamourValueWithArgs: {
		aTextEditor. "then the whole editor element"
		anEvent "the event itself"
	}
]

{ #category : #events }
BrTextCursorAttribute >> wantsEvent: anEvent in: aTextEditor [
	"Return true if I am interested in a given event and want to handle it,
	false otherwise"
	<return: #Boolean>

	^ (anEvent isKindOf: BrTextEditorCursorAddedEvent)
		or: [ anEvent isKindOf: BrTextEditorCursorRemovedEvent ]
]
