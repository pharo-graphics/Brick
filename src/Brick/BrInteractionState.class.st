Class {
	#name : #BrInteractionState,
	#superclass : #Object,
	#category : #'Brick-! Core- Support'
}

{ #category : #'instance creation' }
BrInteractionState class >> default [
	^ BrDefaultState new
]

{ #category : #'instance creation' }
BrInteractionState class >> disabled [
	^ self enabled not
]

{ #category : #'instance creation' }
BrInteractionState class >> enabled [
	^ BrEnabledState new
]

{ #category : #'instance creation' }
BrInteractionState class >> hovered [
	^ BrHoveredState new
]

{ #category : #'instance creation' }
BrInteractionState class >> pressed [
	^ BrPressedState new
]

{ #category : #comparing }
BrInteractionState >> = anotherState [
	^ anotherState class = self class
]

{ #category : #controlling }
BrInteractionState >> and: anAnotherState [
	^ BrConjunctionState new
		left: self;
		right: anAnotherState
]

{ #category : #comparing }
BrInteractionState >> hash [
	^ self class hash
]

{ #category : #testing }
BrInteractionState >> matches: aSetOfStates [
	^ aSetOfStates includes: self
]

{ #category : #controlling }
BrInteractionState >> not [
	^ BrNegationState new state: self
]

{ #category : #controlling }
BrInteractionState >> or: anAnotherState [
	^ BrDisjunctionState new
		left: self;
		right: anAnotherState
]
