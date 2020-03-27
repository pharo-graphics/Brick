Class {
	#name : #BrSelectedState,
	#superclass : #BrInteractionState,
	#category : #'Brick-! Core - States'
}

{ #category : #printing }
BrSelectedState >> printOn: aStream [
	aStream nextPutAll: 'selected'
]
