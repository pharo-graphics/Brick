Class {
	#name : #BrToggleModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'activated',
		'oneWay'
	],
	#category : #'Brick-Toggle - Model'
}

{ #category : #'api - toggle' }
BrToggleModel >> activate [
	self isActivated
		ifTrue: [ ^ self ].

	activated := true.
	self notifyToggleActivated
]

{ #category : #'api - toggle' }
BrToggleModel >> activated: aBoolean [
	aBoolean
		ifTrue: [ self activate ]
		ifFalse: [ self deactivate ]
]

{ #category : #'api - toggle' }
BrToggleModel >> beOneWay [
	"One way toggle can only be activated as a result of click,
	however it can be deactivated programmatically.
	One way toggles are used within a toggle group"
	oneWay := true
]

{ #category : #'mouse handlers' }
BrToggleModel >> clickEvent: anEvent [
	anEvent consumed: true.
	
	self activated: (oneWay or: [ self isActivated not ])
]

{ #category : #'api - toggle' }
BrToggleModel >> deactivate [
	self isActivated
		ifFalse: [ ^ self ].

	activated := false.
	self notifyToggleDeactivated
]

{ #category : #initialization }
BrToggleModel >> initialize [
	super initialize.
	activated := false.
	oneWay := false
]

{ #category : #testing }
BrToggleModel >> isActivated [
	<return: #Boolean>

	^ activated
]

{ #category : #testing }
BrToggleModel >> isOneWay [
	"Return true if I am one way toggle - I can not be deactivated as a result of a click, only programmatically"
	<return: #Boolean>
	
	^ oneWay
]

{ #category : #notifying }
BrToggleModel >> notifyToggleActivated [
	self fireEvent: (BrToggleActivatedEvent toggle: self)
]

{ #category : #notifying }
BrToggleModel >> notifyToggleDeactivated [
	self fireEvent: (BrToggleDeactivatedEvent toggle: self)
]

{ #category : #hooks }
BrToggleModel >> onAttachedTo: anElement [
	super onAttachedTo: anElement.
	self
		when: BrToggleStateRequest
		do: [ self isActivated
				ifTrue: [ BrToggleActivatedEvent toggle: self ]
				ifFalse: [ BrToggleDeactivatedEvent toggle: self ] ]
]

{ #category : #'api - toggle' }
BrToggleModel >> toggle [
	self activated: self isActivated not
]
