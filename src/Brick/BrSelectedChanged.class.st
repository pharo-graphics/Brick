Class {
	#name : #BrSelectedChanged,
	#superclass : #BrStateChangedEvent,
	#instVars : [
		'selected'
	],
	#category : #'Brick-! Core - Events'
}

{ #category : #initialization }
BrSelectedChanged >> initialize [
	super initialize.
	
	selected := false
]

{ #category : #accessing }
BrSelectedChanged >> selected [
	^ selected
]

{ #category : #accessing }
BrSelectedChanged >> selected: anObject [
	selected := anObject
]

{ #category : #accessing }
BrSelectedChanged >> state: anObject [
	"Override me to properly set the given state"

	self selected: anObject
]
