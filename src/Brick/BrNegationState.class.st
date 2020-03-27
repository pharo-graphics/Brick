Class {
	#name : #BrNegationState,
	#superclass : #BrInteractionState,
	#instVars : [
		'state'
	],
	#category : #'Brick-! Core - States'
}

{ #category : #comparing }
BrNegationState >> = anotherState [
	anotherState == self
		ifTrue: [ ^ true ].
		
	anotherState species == self species
		ifFalse: [ ^ false ].
		
	^ self state = anotherState state
]

{ #category : #comparing }
BrNegationState >> hash [
	^ self class hash bitXor: self state hash
]

{ #category : #testing }
BrNegationState >> matches: aSetOfStates [
	^ (self state matches: aSetOfStates) not
]

{ #category : #controlling }
BrNegationState >> not [
	^ self state
]

{ #category : #printing }
BrNegationState >> printOn: aStream [
	aStream
		nextPut: $(;
		nextPutAll: 'not ';
		print: self state;
		nextPut: $)
]

{ #category : #accessing }
BrNegationState >> state [
	^ state
]

{ #category : #accessing }
BrNegationState >> state: anObject [
	state := anObject
]
