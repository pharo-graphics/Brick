Class {
	#name : #BrExpansionState,
	#superclass : #BlElementUniqueState,
	#category : #'Brick-! Core - Expansion'
}

{ #category : #enumerating }
BrExpansionState >> optionalEventHandlerDo: aBlock [
	aBlock value: (BrExpansionStateEventHandler uniqueInstance)
]

{ #category : #accessing }
BrExpansionState >> priority [
	^ UserPriority
]

{ #category : #accessing }
BrExpansionState >> type [
	^ BrExpansionState
]
