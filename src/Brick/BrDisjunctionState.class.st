"
I represent a logical ""OR"", I match the interaction state only any of left or right match
"
Class {
	#name : #BrDisjunctionState,
	#superclass : #BrCompositeState,
	#category : #'Brick-! Core- Support'
}

{ #category : #testing }
BrDisjunctionState >> matches: aSetOfStates [
	^ (self left matches: aSetOfStates) or: [ self right matches: aSetOfStates ]
]
