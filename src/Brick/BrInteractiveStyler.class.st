Class {
	#name : #BrInteractiveStyler,
	#superclass : #Object,
	#instVars : [
		'styles'
	],
	#category : #'Brick-! Core- Support'
}

{ #category : #private }
BrInteractiveStyler >> addState: aState action: anActionBlock [
	styles add: (BrInteractiveStyle new state: aState; action: anActionBlock)
]

{ #category : #builder }
BrInteractiveStyler >> default: aDefaultBlock [
	self
		when: self state default
		set: aDefaultBlock
]

{ #category : #builder }
BrInteractiveStyler >> disabled: aDefaultBlock [
	self
		when: self state disabled
		set: aDefaultBlock
]

{ #category : #builder }
BrInteractiveStyler >> enabled: aDefaultBlock [
	self
		when: self state enabled
		set: aDefaultBlock
]

{ #category : #builder }
BrInteractiveStyler >> hovered: aDefaultBlock [
	self
		when: self state hovered
		set: aDefaultBlock
]

{ #category : #initialization }
BrInteractiveStyler >> initialize [
	super initialize.
	
	styles := OrderedCollection new
]

{ #category : #builder }
BrInteractiveStyler >> pressed: aDefaultBlock [
	self
		when: self state pressed
		set: aDefaultBlock
]

{ #category : #accessing }
BrInteractiveStyler >> state [
	^ BrInteractionState
]

{ #category : #accessing }
BrInteractiveStyler >> styles [
	^ styles
]

{ #category : #builder }
BrInteractiveStyler >> when: aStateBlock set: aSetBlock [
	| aTargetState |
	
	aTargetState := aStateBlock glamourValueWithArgs: { self state }.
	self addState: aTargetState action: aSetBlock
]
