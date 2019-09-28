Class {
	#name : #BrInteractiveCommonLook,
	#superclass : #BrInteractiveLook,
	#category : #'Brick-! Core - Looks'
}

{ #category : #'api - style' }
BrInteractiveCommonLook >> collapsed: aStyleBlock [
	self
		when: self state collapsed
		style: aStyleBlock
]

{ #category : #'api - style' }
BrInteractiveCommonLook >> default: aStyleBlock [
	self
		when: self state default
		style: aStyleBlock
]

{ #category : #'api - style' }
BrInteractiveCommonLook >> deselected: aStyleBlock [
	self
		when: self state deselected
		style: aStyleBlock
]

{ #category : #'api - style' }
BrInteractiveCommonLook >> disabled: aStyleBlock [
	self
		when: self state disabled
		style: aStyleBlock
]

{ #category : #'api - style' }
BrInteractiveCommonLook >> enabled: aStyleBlock [
	self
		when: self state enabled
		style: aStyleBlock
]

{ #category : #'api - style' }
BrInteractiveCommonLook >> expanded: aStyleBlock [
	self
		when: self state expanded
		style: aStyleBlock
]

{ #category : #'api - style' }
BrInteractiveCommonLook >> focused: aStyleBlock [
	self
		when: self state focused
		style: aStyleBlock
]

{ #category : #'api - style' }
BrInteractiveCommonLook >> hovered: aStyleBlock [
	self
		when: self state hovered
		style: aStyleBlock
]

{ #category : #'api - style' }
BrInteractiveCommonLook >> pressed: aStyleBlock [
	self
		when: self state pressed
		style: aStyleBlock
]

{ #category : #'api - style' }
BrInteractiveCommonLook >> selected: aStyleBlock [
	self
		when: self state selected
		style: aStyleBlock
]

{ #category : #accessing }
BrInteractiveCommonLook >> state [
	^ BrInteractionState
]

{ #category : #'api - style' }
BrInteractiveCommonLook >> unfocused: aStyleBlock [
	self
		when: self state unfocused
		style: aStyleBlock
]
