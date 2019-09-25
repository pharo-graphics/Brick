Class {
	#name : #BrInteractiveSizeLook,
	#superclass : #BrInteractiveLook,
	#category : #'Brick-! Core - Looks'
}

{ #category : #'api - style' }
BrInteractiveSizeLook >> default: aStyleBlock [
	self
		when: self state default
		style: aStyleBlock
]

{ #category : #'api - style' }
BrInteractiveSizeLook >> huge: aStyleBlock [
	self
		when: self state huge
		style: aStyleBlock
]

{ #category : #'api - style' }
BrInteractiveSizeLook >> large: aStyleBlock [
	self
		when: self state large
		style: aStyleBlock
]

{ #category : #'api - style' }
BrInteractiveSizeLook >> sized: aNamedSize style: aStyleBlock [
	self
		when: (self state sized: aNamedSize)
		style: aStyleBlock
]

{ #category : #'api - style' }
BrInteractiveSizeLook >> small: aStyleBlock [
	self
		when: self state small
		style: aStyleBlock
]

{ #category : #accessing }
BrInteractiveSizeLook >> state [
	^ BrSizeState
]

{ #category : #'api - style' }
BrInteractiveSizeLook >> tiny: aStyleBlock [
	self
		when: self state tiny
		style: aStyleBlock
]
