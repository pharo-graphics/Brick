Class {
	#name : #BrInteractiveCommonStyler,
	#superclass : #BrInteractiveStyler,
	#category : #'Brick-! Core - Support'
}

{ #category : #builder }
BrInteractiveCommonStyler >> collapsed: aStyleBlock [
	self
		when: self state collapsed
		style: aStyleBlock
]

{ #category : #builder }
BrInteractiveCommonStyler >> default: aStyleBlock [
	self
		when: self state default
		style: aStyleBlock
]

{ #category : #builder }
BrInteractiveCommonStyler >> deselected: aStyleBlock [
	self
		when: self state deselected
		style: aStyleBlock
]

{ #category : #builder }
BrInteractiveCommonStyler >> disabled: aStyleBlock [
	self
		when: self state disabled
		style: aStyleBlock
]

{ #category : #builder }
BrInteractiveCommonStyler >> enabled: aStyleBlock [
	self
		when: self state enabled
		style: aStyleBlock
]

{ #category : #builder }
BrInteractiveCommonStyler >> expanded: aStyleBlock [
	self
		when: self state expanded
		style: aStyleBlock
]

{ #category : #builder }
BrInteractiveCommonStyler >> focused: aStyleBlock [
	self
		when: self state focused
		style: aStyleBlock
]

{ #category : #builder }
BrInteractiveCommonStyler >> hovered: aStyleBlock [
	self
		when: self state hovered
		style: aStyleBlock
]

{ #category : #builder }
BrInteractiveCommonStyler >> huge: aStyleBlock [
	self
		when: self state huge
		style: aStyleBlock
]

{ #category : #builder }
BrInteractiveCommonStyler >> large: aStyleBlock [
	self
		when: self state large
		style: aStyleBlock
]

{ #category : #builder }
BrInteractiveCommonStyler >> pressed: aStyleBlock [
	self
		when: self state pressed
		style: aStyleBlock
]

{ #category : #builder }
BrInteractiveCommonStyler >> selected: aStyleBlock [
	self
		when: self state selected
		style: aStyleBlock
]

{ #category : #builder }
BrInteractiveCommonStyler >> sized: aNamedSize style: aStyleBlock [
	self
		when: (self state sized: aNamedSize)
		style: aStyleBlock
]

{ #category : #builder }
BrInteractiveCommonStyler >> small: aStyleBlock [
	self
		when: self state small
		style: aStyleBlock
]

{ #category : #accessing }
BrInteractiveCommonStyler >> state [
	^ BrInteractionState
]

{ #category : #builder }
BrInteractiveCommonStyler >> tiny: aStyleBlock [
	self
		when: self state tiny
		style: aStyleBlock
]

{ #category : #builder }
BrInteractiveCommonStyler >> unfocused: aStyleBlock [
	self
		when: self state unfocused
		style: aStyleBlock
]
