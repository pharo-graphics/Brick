Class {
	#name : #BrInteractionState,
	#superclass : #Object,
	#category : #'Brick-! Core - States'
}

{ #category : #'instance creation' }
BrInteractionState class >> collapsed [
	^ self expanded not
]

{ #category : #'instance creation' }
BrInteractionState class >> default [
	^ BrDefaultState new
]

{ #category : #'instance creation' }
BrInteractionState class >> deselected [
	^ self selected not
]

{ #category : #'instance creation' }
BrInteractionState class >> disabled [
	^ BrDisabledState new
]

{ #category : #'instance creation' }
BrInteractionState class >> enabled [
	^ self disabled not
]

{ #category : #'instance creation' }
BrInteractionState class >> expanded [
	^ BrExpandedState new
]

{ #category : #'instance creation' }
BrInteractionState class >> focused [
	^ BrFocusedState new
]

{ #category : #'instance creation' }
BrInteractionState class >> hovered [
	^ BrHoveredState new
]

{ #category : #'instance creation' }
BrInteractionState class >> pressed [
	^ BrPressedState new
]

{ #category : #'instance creation' }
BrInteractionState class >> selected [
	^ BrSelectedState new
]

{ #category : #'instance creation' }
BrInteractionState class >> unfocused [
	^ self focused not
]

{ #category : #controlling }
BrInteractionState >> & anAnotherState [
	^ self and: anAnotherState
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

{ #category : #controlling }
BrInteractionState >> | anAnotherState [
	^ self or: anAnotherState
]
