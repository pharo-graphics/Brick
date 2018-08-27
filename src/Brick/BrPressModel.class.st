Class {
	#name : #BrPressModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'pressed'
	],
	#category : #'Brick-! Core'
}

{ #category : #initialization }
BrPressModel >> initialize [
	super initialize.
	
	pressed := false
]

{ #category : #initialization }
BrPressModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrPressedRequest reply: [ :aResponse | aResponse pressed: self isPressed ]
]

{ #category : #testing }
BrPressModel >> isPressed [
	^ pressed
]

{ #category : #'mouse handlers' }
BrPressModel >> mouseDownEvent: anEvent [
	anEvent consumed: true.

	pressed := true.
	self notifyPressChanged
]

{ #category : #'mouse handlers' }
BrPressModel >> mouseUpEvent: anEvent [
	anEvent consumed: true.

	pressed := false.
	self notifyPressChanged
]

{ #category : #notifying }
BrPressModel >> notifyPressChanged [
	self dispatchEvent: (BrPressedChanged pressed: self isPressed)
]
