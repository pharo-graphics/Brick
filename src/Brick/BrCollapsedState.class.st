Class {
	#name : #BrCollapsedState,
	#superclass : #BrExpansionState,
	#category : #'Brick-! Core - Expansion'
}

{ #category : #enumerating }
BrCollapsedState >> optionalOnAddedTo: anElement [
	anElement dispatchEvent: BrCollapsedEvent new
]

{ #category : #printing }
BrCollapsedState >> printOn: aStream [
	aStream nextPutAll: 'collapsed'
]
