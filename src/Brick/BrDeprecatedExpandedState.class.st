Class {
	#name : #BrDeprecatedExpandedState,
	#superclass : #BrInteractionState,
	#category : #'Brick-! Deprecated'
}

{ #category : #testing }
BrDeprecatedExpandedState class >> isDeprecated [
	^ true
]

{ #category : #printing }
BrDeprecatedExpandedState >> printOn: aStream [
	aStream nextPutAll: 'expanded'
]
