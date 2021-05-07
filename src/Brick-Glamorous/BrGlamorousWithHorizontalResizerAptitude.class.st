Class {
	#name : #BrGlamorousWithHorizontalResizerAptitude,
	#superclass : #BrGlamorousWithResizerAptitude,
	#category : #'Brick-Glamorous-Resizer'
}

{ #category : #'api - location' }
BrGlamorousWithHorizontalResizerAptitude >> beLeft [

	resizer beLeft
]

{ #category : #'api - location' }
BrGlamorousWithHorizontalResizerAptitude >> beRight [

	resizer beRight
]

{ #category : #initialization }
BrGlamorousWithHorizontalResizerAptitude >> initialize [
	super initialize.

	self beRight.
]
