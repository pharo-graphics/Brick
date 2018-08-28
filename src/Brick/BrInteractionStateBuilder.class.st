Class {
	#name : #BrInteractionStateBuilder,
	#superclass : #Object,
	#instVars : [
		'conditions'
	],
	#category : #'Brick-! Core- Support'
}

{ #category : #private }
BrInteractionStateBuilder >> addState: aState action: anActionBlock [
	conditions add: (BrInteractionCondition new state: aState; action: anActionBlock)
]

{ #category : #accessing }
BrInteractionStateBuilder >> conditions [
	^ conditions
]

{ #category : #builder }
BrInteractionStateBuilder >> default: aDefaultBlock [
	self
		when: self state default
		set: aDefaultBlock
]

{ #category : #builder }
BrInteractionStateBuilder >> disabled: aDefaultBlock [
	self
		when: self state disabled
		set: aDefaultBlock
]

{ #category : #builder }
BrInteractionStateBuilder >> enabled: aDefaultBlock [
	self
		when: self state enabled
		set: aDefaultBlock
]

{ #category : #builder }
BrInteractionStateBuilder >> hovered: aDefaultBlock [
	self
		when: self state hovered
		set: aDefaultBlock
]

{ #category : #initialization }
BrInteractionStateBuilder >> initialize [
	super initialize.
	
	conditions := OrderedCollection new
]

{ #category : #builder }
BrInteractionStateBuilder >> pressed: aDefaultBlock [
	self
		when: self state pressed
		set: aDefaultBlock
]

{ #category : #accessing }
BrInteractionStateBuilder >> state [
	^ BrInteractionState
]

{ #category : #builder }
BrInteractionStateBuilder >> when: aStateBlock set: aSetBlock [
	| aTargetState |
	
	aTargetState := aStateBlock glamourValueWithArgs: { self state }.
	self addState: aTargetState action: aSetBlock
]
