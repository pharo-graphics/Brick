"
I represent a logical ""AND"", I match the interaction state only if both left and right states match
"
Class {
	#name : #BrConjunctionState,
	#superclass : #BrCompositeState,
	#category : #'Brick-! Core - States'
}

{ #category : #testing }
BrConjunctionState >> matches: aSetOfStates [
	^ (self left matches: aSetOfStates) and: [ self right matches: aSetOfStates ]
]

{ #category : #printing }
BrConjunctionState >> printOn: aStream [
	aStream
		nextPut: $(;
		print: self left;
		nextPutAll: ' & ';
		print: self right;
		nextPut: $)
]
