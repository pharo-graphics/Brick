Class {
	#name : #BrInteractiveCommonAptitude,
	#superclass : #BrInteractiveAptitude,
	#category : #'Brick-! Deprecated'
}

{ #category : #testing }
BrInteractiveCommonAptitude class >> isDeprecated [
	^ true
]

{ #category : #'api - style' }
BrInteractiveCommonAptitude >> collapsed: aStyleBlock [
	self
		when: self state collapsed
		style: aStyleBlock
]

{ #category : #'api - style' }
BrInteractiveCommonAptitude >> default: aStyleBlock [
	self
		when: self state default
		style: aStyleBlock
]

{ #category : #'api - style' }
BrInteractiveCommonAptitude >> deselected: aStyleBlock [
	self
		when: self state deselected
		style: aStyleBlock
]

{ #category : #'api - style' }
BrInteractiveCommonAptitude >> disabled: aStyleBlock [
	self
		when: self state disabled
		style: aStyleBlock
]

{ #category : #'api - style' }
BrInteractiveCommonAptitude >> enabled: aStyleBlock [
	self
		when: self state enabled
		style: aStyleBlock
]

{ #category : #'api - style' }
BrInteractiveCommonAptitude >> expanded: aStyleBlock [
	self
		when: self state expanded
		style: aStyleBlock
]

{ #category : #'api - style' }
BrInteractiveCommonAptitude >> focused: aStyleBlock [
	self
		when: self state focused
		style: aStyleBlock
]

{ #category : #'api - style' }
BrInteractiveCommonAptitude >> hovered: aStyleBlock [
	self
		when: self state hovered
		style: aStyleBlock
]

{ #category : #'api - style' }
BrInteractiveCommonAptitude >> pressed: aStyleBlock [
	self
		when: self state pressed
		style: aStyleBlock
]

{ #category : #'api - style' }
BrInteractiveCommonAptitude >> selected: aStyleBlock [
	self
		when: self state selected
		style: aStyleBlock
]

{ #category : #accessing }
BrInteractiveCommonAptitude >> state [
	^ BrInteractionState
]

{ #category : #'api - style' }
BrInteractiveCommonAptitude >> unfocused: aStyleBlock [
	self
		when: self state unfocused
		style: aStyleBlock
]
