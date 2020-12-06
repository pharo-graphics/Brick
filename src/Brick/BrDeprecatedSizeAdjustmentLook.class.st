Class {
	#name : #BrDeprecatedSizeAdjustmentLook,
	#superclass : #BrInteractiveLook,
	#category : #'Brick-! Deprecated'
}

{ #category : #testing }
BrDeprecatedSizeAdjustmentLook class >> isDeprecated [
	^ true
]

{ #category : #'api - style' }
BrDeprecatedSizeAdjustmentLook >> default: aStyleBlock [
	self
		when: self state default
		style: aStyleBlock
]

{ #category : #'api - style' }
BrDeprecatedSizeAdjustmentLook >> huge: aStyleBlock [
	self
		when: self state huge
		style: aStyleBlock
]

{ #category : #'api - style' }
BrDeprecatedSizeAdjustmentLook >> large: aStyleBlock [
	self
		when: self state large
		style: aStyleBlock
]

{ #category : #'api - style' }
BrDeprecatedSizeAdjustmentLook >> mini: aStyleBlock [
	self
		when: self state mini
		style: aStyleBlock
]

{ #category : #'api - style' }
BrDeprecatedSizeAdjustmentLook >> sized: aNamedSize style: aStyleBlock [
	self
		when: (self state sized: aNamedSize)
		style: aStyleBlock
]

{ #category : #'api - style' }
BrDeprecatedSizeAdjustmentLook >> small: aStyleBlock [
	self
		when: self state small
		style: aStyleBlock
]

{ #category : #accessing }
BrDeprecatedSizeAdjustmentLook >> state [
	^ BrDeprecatedSizeAdjustmentState
]

{ #category : #'api - style' }
BrDeprecatedSizeAdjustmentLook >> tiny: aStyleBlock [
	self
		when: self state tiny
		style: aStyleBlock
]
