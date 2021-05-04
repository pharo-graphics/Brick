Class {
	#name : #BrGlamorousToggleLayoutAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Glamorous-Toggle - Support'
}

{ #category : #initialization }
BrGlamorousToggleLayoutAptitude >> initialize [
	super initialize.
	
	self add: BrLayoutResizerAptitude inherit.
	self add: BrLayoutAlignmentAptitude forHorizontalLinearLayout
]
