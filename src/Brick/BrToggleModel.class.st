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
	self activateDueTo: nil
]

{ #category : #'api - toggle' }
BrToggleModel >> activateDueTo: anEvent [
	self isActivated
		ifTrue: [ ^ self ].

	activated := true.
	self notifyToggleActivatedDueTo: anEvent
]

{ #category : #'api - toggle' }
BrToggleModel >> activated: aBoolean [
	self activated: aBoolean dueTo: nil
]

{ #category : #'api - toggle' }
BrToggleModel >> activated: aBoolean dueTo: anEvent [
	aBoolean
		ifTrue: [ self activateDueTo: anEvent ]
		ifFalse: [ self deactivateDueTo: anEvent ]
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
	
	(self request: BrEnablementRequest oneWay) isEnabled
		ifTrue: [ self 
				activated: (self isOneWay or: [ self isActivated not ]) 
				dueTo: anEvent ]
]

{ #category : #'api - toggle' }
BrToggleModel >> deactivate [
	self deactivateDueTo: nil
]

{ #category : #'api - toggle' }
BrToggleModel >> deactivateDueTo: anEvent [
	self isActivated
		ifFalse: [ ^ self ].

	activated := false.
	self notifyToggleDeactivatedDueTo: anEvent
]

{ #category : #initialization }
BrToggleModel >> initialize [
	super initialize.
	activated := false.
	oneWay := false
]

{ #category : #hooks }
BrToggleModel >> initializeListeners [
	super initializeListeners.

	self
		when: BrToggleStateRequest
		do: [ self isActivated
				ifTrue: [ BrToggleActivatedEvent toggle: self ]
				ifFalse: [ BrToggleDeactivatedEvent toggle: self ] ].
			
	self when: BlClickEvent do: [ :anEvent | self clickEvent: anEvent ]
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
	self notifyToggleActivatedDueTo: nil
]

{ #category : #notifying }
BrToggleModel >> notifyToggleActivatedDueTo: anEvent [
	self fireEvent: (BrToggleActivatedEvent toggle: self originalEvent: anEvent)
]

{ #category : #notifying }
BrToggleModel >> notifyToggleDeactivated [
	self notifyToggleDeactivatedDueTo: nil
]

{ #category : #notifying }
BrToggleModel >> notifyToggleDeactivatedDueTo: anEvent [
	self fireEvent: (BrToggleDeactivatedEvent toggle: self originalEvent: anEvent)
]

{ #category : #'api - toggle' }
BrToggleModel >> toggle [
	self activated: self isActivated not
]
