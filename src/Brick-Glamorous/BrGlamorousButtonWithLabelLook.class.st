Class {
	#name : #BrGlamorousButtonWithLabelLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousButtonWithLabelLook >> initialize [
	super initialize.
	
	self addAll: {
		BrGlamorousButtonExteriorRectangularLook new.
		BrGlamorousButtonLabelLook new.
	}
]
