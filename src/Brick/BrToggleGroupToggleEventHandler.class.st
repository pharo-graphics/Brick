Class {
	#name : #BrToggleGroupToggleEventHandler,
	#superclass : #BlCustomEventHandler,
	#instVars : [
		'toggleGroup'
	],
	#category : #'Brick-Toggle - Events'
}

{ #category : #'api - accessing' }
BrToggleGroupToggleEventHandler >> eventsToHandle [
	^ {
		BrToggleActivatedEvent.
		BrToggleDeactivatedEvent.
	}
]

{ #category : #'api - event managing' }
BrToggleGroupToggleEventHandler >> handleEvent: aTabEvent [
	aTabEvent sendTo: self
]

{ #category : #'api - event managing' }
BrToggleGroupToggleEventHandler >> toggleActivated: anEvent [
	self toggleGroup activateToggle: anEvent toggle
]

{ #category : #'api - event managing' }
BrToggleGroupToggleEventHandler >> toggleDeactivated: anEvent [
	self toggleGroup deactivateToggle: anEvent toggle
]

{ #category : #accessing }
BrToggleGroupToggleEventHandler >> toggleGroup [
	^ toggleGroup
]

{ #category : #accessing }
BrToggleGroupToggleEventHandler >> toggleGroup: anObject [
	toggleGroup := anObject
]
