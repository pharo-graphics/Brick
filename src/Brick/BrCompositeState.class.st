Class {
	#name : #BrCompositeState,
	#superclass : #BrInteractionState,
	#instVars : [
		'left',
		'right'
	],
	#category : #'Brick-! Core - States'
}

{ #category : #comparing }
BrCompositeState >> = anotherState [
	anotherState == self
		ifTrue: [ ^ true ].
		
	anotherState species == self species
		ifFalse: [ ^ false ].
		
	^ self left = anotherState left
		and: [ self right = anotherState right ]
]

{ #category : #comparing }
BrCompositeState >> hash [
	^ (self class hash bitXor: self left hash) bitXor: self right hash
]

{ #category : #accessing }
BrCompositeState >> left [
	^ left
]

{ #category : #accessing }
BrCompositeState >> left: anObject [
	left := anObject
]

{ #category : #testing }
BrCompositeState >> matches: aSetOfStates [
	^ self subclassResponsibility
]

{ #category : #accessing }
BrCompositeState >> right [
	^ right
]

{ #category : #accessing }
BrCompositeState >> right: anObject [
	right := anObject
]
