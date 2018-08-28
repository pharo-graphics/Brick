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
BrInteractiveStyler >> default: aStyleBlock [
	self
		when: self state default
		style: aStyleBlock
]

{ #category : #builder }
BrInteractiveStyler >> disabled: aStyleBlock [
	self
		when: self state disabled
		style: aStyleBlock
]

{ #category : #builder }
BrInteractiveStyler >> enabled: aStyleBlock [
	self
		when: self state enabled
		style: aStyleBlock
]

{ #category : #builder }
BrInteractiveStyler >> hovered: aStyleBlock [
	self
		when: self state hovered
		style: aStyleBlock
]

{ #category : #initialization }
BrInteractiveStyler >> initialize [
	super initialize.
	
	styles := OrderedCollection new
]

{ #category : #builder }
BrInteractiveStyler >> pressed: aStyleBlock [
	self
		when: self state pressed
		style: aStyleBlock
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
BrInteractiveStyler >> when: aStateBlock style: aStyleBlock [
	| aTargetState |
	
	aTargetState := aStateBlock glamourValueWithArgs: { self state }.
	self addState: aTargetState action: aStyleBlock
]
