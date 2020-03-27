Class {
	#name : #BrHoveredState,
	#superclass : #BrInteractionState,
	#category : #'Brick-! Core - States'
}

{ #category : #printing }
BrHoveredState >> printOn: aStream [
	aStream nextPutAll: 'hovered'
]
