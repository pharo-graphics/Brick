Class {
	#name : #BrFocusedState,
	#superclass : #BrInteractionState,
	#category : #'Brick-! Core - States'
}

{ #category : #printing }
BrFocusedState >> printOn: aStream [
	aStream nextPutAll: 'focused'
]
