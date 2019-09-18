Class {
	#name : #BrActivationWish,
	#superclass : #BrWish,
	#instVars : [
		'activated'
	],
	#category : #'Brick-! Core - Events'
}

{ #category : #'instance creation' }
BrActivationWish class >> activated: aBoolean [
	^ self new activated: aBoolean
]

{ #category : #accessing }
BrActivationWish >> activated [
	^ activated
]

{ #category : #accessing }
BrActivationWish >> activated: anObject [
	activated := anObject
]

{ #category : #initialization }
BrActivationWish >> initialize [
	super initialize.
	
	activated := false
]

{ #category : #testing }
BrActivationWish >> isActivated [
	^ activated
]
