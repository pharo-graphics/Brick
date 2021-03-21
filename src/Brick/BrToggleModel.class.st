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
	self onToggleActivatedDueTo: anEvent
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
	
	(self widget states hasState: BlElementState disabled)
		ifFalse: [
			self 
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
	self onToggleDeactivatedDueTo: anEvent
]

{ #category : #initialization }
BrToggleModel >> initialize [
	super initialize.
	activated := false.
	oneWay := false
]

{ #category : #initialization }
BrToggleModel >> initializeListeners [
	super initializeListeners.

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
BrToggleModel >> notifyToggleActivatedDueTo: anEvent [
	self dispatchEvent: (BrToggleActivatedEvent toggle: self originalEvent: anEvent)
]

{ #category : #notifying }
BrToggleModel >> notifyToggleDeactivatedDueTo: anEvent [
	self dispatchEvent: (BrToggleDeactivatedEvent toggle: self originalEvent: anEvent)
]

{ #category : #hooks }
BrToggleModel >> onToggleActivatedDueTo: anEvent [
	
	self widgetDo: [ :aWidget | aWidget states addState: BrToggleState activated ].
	self notifyToggleActivatedDueTo: anEvent
]

{ #category : #hooks }
BrToggleModel >> onToggleDeactivatedDueTo: anEvent [

	self widgetDo: [ :aWidget | aWidget states addState: BrToggleState deactivated ].
	self notifyToggleDeactivatedDueTo: anEvent
]

{ #category : #'api - toggle' }
BrToggleModel >> toggle [
	self activated: self isActivated not
]
