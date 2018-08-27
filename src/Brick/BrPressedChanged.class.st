Class {
	#name : #BrPressedChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'pressed'
	],
	#category : #'Brick-! Core - Events'
}

{ #category : #'instance creation' }
BrPressedChanged class >> pressed: aBoolean [
	^ self new pressed: aBoolean
]

{ #category : #testing }
BrPressedChanged >> isPressed [
	^ self pressed
]

{ #category : #accessing }
BrPressedChanged >> pressed [
	^ pressed
]

{ #category : #accessing }
BrPressedChanged >> pressed: anObject [
	pressed := anObject
]
