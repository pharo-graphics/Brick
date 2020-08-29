Class {
	#name : #BrGlamorousWithVerticalResizerLook,
	#superclass : #BrGlamorousWithResizerLook,
	#category : #'Brick-Glamorous-Resizer'
}

{ #category : #'api - location' }
BrGlamorousWithVerticalResizerLook >> beBottom [
	resizer beBottom
]

{ #category : #'api - location' }
BrGlamorousWithVerticalResizerLook >> beTop [
	resizer beTop
]

{ #category : #initialization }
BrGlamorousWithVerticalResizerLook >> initialize [
	super initialize.

	self beBottom.
]
