Class {
	#name : #BrSizeAdjustmentLook,
	#superclass : #BrInteractiveLook,
	#category : #'Brick-! Core - Looks'
}

{ #category : #'api - style' }
BrSizeAdjustmentLook >> default: aStyleBlock [
	self
		when: self state default
		style: aStyleBlock
]

{ #category : #'api - style' }
BrSizeAdjustmentLook >> huge: aStyleBlock [
	self
		when: self state huge
		style: aStyleBlock
]

{ #category : #'api - style' }
BrSizeAdjustmentLook >> large: aStyleBlock [
	self
		when: self state large
		style: aStyleBlock
]

{ #category : #'api - style' }
BrSizeAdjustmentLook >> mini: aStyleBlock [
	self
		when: self state mini
		style: aStyleBlock
]

{ #category : #'api - style' }
BrSizeAdjustmentLook >> sized: aNamedSize style: aStyleBlock [
	self
		when: (self state sized: aNamedSize)
		style: aStyleBlock
]

{ #category : #'api - style' }
BrSizeAdjustmentLook >> small: aStyleBlock [
	self
		when: self state small
		style: aStyleBlock
]

{ #category : #accessing }
BrSizeAdjustmentLook >> state [
	^ BrSizeAdjustmentState
]

{ #category : #'api - style' }
BrSizeAdjustmentLook >> tiny: aStyleBlock [
	self
		when: self state tiny
		style: aStyleBlock
]
