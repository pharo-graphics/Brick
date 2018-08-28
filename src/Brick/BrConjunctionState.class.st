"
I represent a logical ""AND"", I match the interaction state only if both left and right states match
"
Class {
	#name : #BrConjunctionState,
	#superclass : #BrCompositeState,
	#category : #'Brick-! Core- Support'
}

{ #category : #testing }
BrConjunctionState >> matches: aSetOfStates [
	^ (self left matches: aSetOfStates) and: [ self right matches: aSetOfStates ]
]
