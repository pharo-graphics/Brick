Class {
	#name : #BrDisabledState,
	#superclass : #BrInteractionState,
	#category : #'Brick-! Core - States'
}

{ #category : #printing }
BrDisabledState >> printOn: aStream [
	aStream nextPutAll: 'disabled'
]
