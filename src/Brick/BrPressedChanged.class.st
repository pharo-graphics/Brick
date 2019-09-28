Class {
	#name : #BrPressedChanged,
	#superclass : #BrStateChangedEvent,
	#instVars : [
		'pressed'
	],
	#category : #'Brick-! Core - Events'
}

{ #category : #'instance creation' }
BrPressedChanged class >> pressed: aBoolean [
	^ self new pressed: aBoolean
]

{ #category : #initialization }
BrPressedChanged >> initialize [
	super initialize.
	
	pressed := false
]

{ #category : #testing }
BrPressedChanged >> isPressed [
	<return: #Boolean>

	^ self pressed
]

{ #category : #accessing }
BrPressedChanged >> pressed [
	<return: #Boolean>

	^ pressed
]

{ #category : #accessing }
BrPressedChanged >> pressed: aBoolean [
	pressed := aBoolean
]

{ #category : #accessing }
BrPressedChanged >> state: anObject [
	"Override me to properly set the given state"

	self pressed: anObject
]
