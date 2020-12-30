Class {
	#name : #BrGlamorousToggleLayoutLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Toggle - Support'
}

{ #category : #initialization }
BrGlamorousToggleLayoutLook >> initialize [
	super initialize.
	
	self add: BrLayoutResizerLook inherit.
	self add: BrLayoutAlignmentLook forHorizontalLinearLayout
]
