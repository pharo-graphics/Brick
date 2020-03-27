Class {
	#name : #BrExpandedState,
	#superclass : #BrInteractionState,
	#category : #'Brick-! Core - States'
}

{ #category : #printing }
BrExpandedState >> printOn: aStream [
	aStream nextPutAll: 'expanded'
]
