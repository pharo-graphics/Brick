Class {
	#name : #BrTabGroupTabEventHandler,
	#superclass : #BlCustomEventHandler,
	#instVars : [
		'tabGroup'
	],
	#category : #'Brick-Tabs - Events'
}

{ #category : #'api - accessing' }
BrTabGroupTabEventHandler >> eventsToHandle [
	^ {
		BrTabActionbarChangedEvent.
		BrTabDeselectedEvent.
		BrTabSelectedEvent.
		BrTabStencilChangedEvent.
		BrTabToolbarChangedEvent
	}
]

{ #category : #'api - event managing' }
BrTabGroupTabEventHandler >> handleEvent: aTabEvent [
	aTabEvent sendTo: self
]

{ #category : #'event handling' }
BrTabGroupTabEventHandler >> tabActionbarChanged: anEvent [
]

{ #category : #'event handling' }
BrTabGroupTabEventHandler >> tabDeselected: anEvent [
	self tabGroup deselectTab: anEvent tab
]

{ #category : #accessing }
BrTabGroupTabEventHandler >> tabGroup [
	^ tabGroup
]

{ #category : #accessing }
BrTabGroupTabEventHandler >> tabGroup: anObject [
	tabGroup := anObject
]

{ #category : #'event handling' }
BrTabGroupTabEventHandler >> tabSelected: anEvent [
	self tabGroup selectTab: anEvent tab
]

{ #category : #'event handling' }
BrTabGroupTabEventHandler >> tabStencilChanged: anEvent [
	self tabGroup notifyTabStencilChanged: anEvent
]

{ #category : #'event handling' }
BrTabGroupTabEventHandler >> tabToolbarChanged: anEvent [
	self tabGroup notifyTabToolbarChanged: anEvent
]
