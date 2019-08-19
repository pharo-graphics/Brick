Class {
	#name : #BrGlamorousLabelLook,
	#superclass : #BrGlamorousTextLabelLook,
	#category : #'Brick-Glamorous-Label'
}

{ #category : #initialization }
BrGlamorousLabelLook >> initialize [
	super initialize.
	
	self add: BrLayoutResizerLook new inherit.
	self add: (BrLayoutAlignmentLook forHorizontalLinearLayout)
]
