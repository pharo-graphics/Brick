Class {
	#name : #BrGlamorousButtonLayoutAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #initialization }
BrGlamorousButtonLayoutAptitude >> initialize [
	super initialize.
	
	self add: BrLayoutResizerAptitude inherit.
	self add: BrLayoutAlignmentAptitude forHorizontalLinearLayout
]
