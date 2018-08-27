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
