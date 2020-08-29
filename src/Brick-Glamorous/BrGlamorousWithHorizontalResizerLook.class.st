Class {
	#name : #BrGlamorousWithHorizontalResizerLook,
	#superclass : #BrGlamorousWithResizerLook,
	#category : #'Brick-Glamorous-Resizer'
}

{ #category : #'api - location' }
BrGlamorousWithHorizontalResizerLook >> beLeft [

	resizer beLeft
]

{ #category : #'api - location' }
BrGlamorousWithHorizontalResizerLook >> beRight [

	resizer beRight
]

{ #category : #initialization }
BrGlamorousWithHorizontalResizerLook >> initialize [
	super initialize.

	self beRight.
]
