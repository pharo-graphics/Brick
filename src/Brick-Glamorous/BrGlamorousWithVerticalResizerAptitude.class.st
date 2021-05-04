Class {
	#name : #BrGlamorousWithVerticalResizerAptitude,
	#superclass : #BrGlamorousWithResizerAptitude,
	#category : #'Brick-Glamorous-Resizer'
}

{ #category : #'api - location' }
BrGlamorousWithVerticalResizerAptitude >> beBottom [
	resizer beBottom
]

{ #category : #'api - location' }
BrGlamorousWithVerticalResizerAptitude >> beTop [
	resizer beTop
]

{ #category : #initialization }
BrGlamorousWithVerticalResizerAptitude >> initialize [
	super initialize.

	self beBottom.
]
