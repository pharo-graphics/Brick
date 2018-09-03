Class {
	#name : #BrFocusedChanged,
	#superclass : #BrStateChangedEvent,
	#instVars : [
		'focused'
	],
	#category : #'Brick-! Core - Events'
}

{ #category : #'instance creation' }
BrFocusedChanged class >> focused: aBoolean [
	^ self new focused: aBoolean
]

{ #category : #accessing }
BrFocusedChanged >> focused [
	<return: #Boolean>

	^ focused
]

{ #category : #accessing }
BrFocusedChanged >> focused: aBoolean [
	focused := aBoolean
]

{ #category : #testing }
BrFocusedChanged >> isFocused [
	<return: #Boolean>

	^ self focused
]

{ #category : #accessing }
BrFocusedChanged >> state: anObject [
	self focused: anObject
]
