Class {
	#name : #BrInteractiveStyler,
	#superclass : #Object,
	#instVars : [
		'styles'
	],
	#category : #'Brick-! Core - Support'
}

{ #category : #private }
BrInteractiveStyler >> addState: aState action: anActionBlock [
	styles add: (BrInteractiveStyle new state: aState; action: anActionBlock)
]

{ #category : #builder }
BrInteractiveStyler >> collapsed: aStyleBlock [
	self
		when: self state collapsed
		style: aStyleBlock
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
BrInteractiveStyler >> expanded: aStyleBlock [
	self
		when: self state expanded
		style: aStyleBlock
]

{ #category : #builder }
BrInteractiveStyler >> focused: aStyleBlock [
	self
		when: self state focused
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
BrInteractiveStyler >> large: aStyleBlock [
	self
		when: self state large
		style: aStyleBlock
]

{ #category : #builder }
BrInteractiveStyler >> pressed: aStyleBlock [
	self
		when: self state pressed
		style: aStyleBlock
]

{ #category : #builder }
BrInteractiveStyler >> sized: aNamedSize style: aStyleBlock [
	self
		when: (self state sized: aNamedSize)
		style: aStyleBlock
]

{ #category : #builder }
BrInteractiveStyler >> small: aStyleBlock [
	self
		when: self state small
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
BrInteractiveStyler >> tiny: aStyleBlock [
	self
		when: self state tiny
		style: aStyleBlock
]

{ #category : #builder }
BrInteractiveStyler >> unfocused: aStyleBlock [
	self
		when: self state unfocused
		style: aStyleBlock
]

{ #category : #builder }
BrInteractiveStyler >> when: aStateBlock style: aStyleBlock [
	| aTargetState |
	
	aTargetState := aStateBlock glamourValueWithArgs: { self state }.
	self addState: aTargetState action: aStyleBlock
]
