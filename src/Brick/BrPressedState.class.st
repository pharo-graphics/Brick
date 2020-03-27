Class {
	#name : #BrPressedState,
	#superclass : #BrInteractionState,
	#category : #'Brick-! Core - States'
}

{ #category : #printing }
BrPressedState >> printOn: aStream [
	aStream nextPutAll: 'pressed'
]
