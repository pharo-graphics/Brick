Class {
	#name : #BrGlamorousButtonLayoutLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #initialization }
BrGlamorousButtonLayoutLook >> initialize [
	super initialize.
	
	self add: BrLayoutResizerLook inherit.
	self add: BrLayoutAlignmentLook forHorizontalLinearLayout
]
