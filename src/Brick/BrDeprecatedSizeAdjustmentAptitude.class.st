Class {
	#name : #BrDeprecatedSizeAdjustmentAptitude,
	#superclass : #BrInteractiveAptitude,
	#category : #'Brick-! Deprecated'
}

{ #category : #testing }
BrDeprecatedSizeAdjustmentAptitude class >> isDeprecated [
	^ true
]

{ #category : #'api - style' }
BrDeprecatedSizeAdjustmentAptitude >> default: aStyleBlock [
	self
		when: self state default
		style: aStyleBlock
]

{ #category : #'api - style' }
BrDeprecatedSizeAdjustmentAptitude >> huge: aStyleBlock [
	self
		when: self state huge
		style: aStyleBlock
]

{ #category : #'api - style' }
BrDeprecatedSizeAdjustmentAptitude >> large: aStyleBlock [
	self
		when: self state large
		style: aStyleBlock
]

{ #category : #'api - style' }
BrDeprecatedSizeAdjustmentAptitude >> mini: aStyleBlock [
	self
		when: self state mini
		style: aStyleBlock
]

{ #category : #'api - style' }
BrDeprecatedSizeAdjustmentAptitude >> sized: aNamedSize style: aStyleBlock [
	self
		when: (self state sized: aNamedSize)
		style: aStyleBlock
]

{ #category : #'api - style' }
BrDeprecatedSizeAdjustmentAptitude >> small: aStyleBlock [
	self
		when: self state small
		style: aStyleBlock
]

{ #category : #accessing }
BrDeprecatedSizeAdjustmentAptitude >> state [
	^ BrDeprecatedSizeAdjustmentState
]

{ #category : #'api - style' }
BrDeprecatedSizeAdjustmentAptitude >> tiny: aStyleBlock [
	self
		when: self state tiny
		style: aStyleBlock
]
