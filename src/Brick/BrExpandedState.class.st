Class {
	#name : #BrExpandedState,
	#superclass : #BrInteractionState,
	#category : #'Brick-! Deprecated'
}

{ #category : #testing }
BrExpandedState class >> isDeprecated [
	^ true
]

{ #category : #printing }
BrExpandedState >> printOn: aStream [
	aStream nextPutAll: 'expanded'
]
