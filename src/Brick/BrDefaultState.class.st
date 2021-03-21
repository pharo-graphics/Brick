Class {
	#name : #BrDefaultState,
	#superclass : #BrInteractionState,
	#category : #'Brick-! Core - States'
}

{ #category : #testing }
BrDefaultState >> matches: aSetOfStates [
	^ true
]

{ #category : #printing }
BrDefaultState >> printOn: aStream [
	aStream nextPutAll: 'default'
]
