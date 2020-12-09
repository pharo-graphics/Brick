Class {
	#name : #BrExpandedState,
	#superclass : #BrExpansionState,
	#category : #'Brick-! Core - Expansion'
}

{ #category : #enumerating }
BrExpandedState >> optionalOnAddedTo: anElement [
	anElement dispatchEvent: BrExpandedEvent new
]

{ #category : #printing }
BrExpandedState >> printOn: aStream [
	aStream nextPutAll: 'expanded'
]
