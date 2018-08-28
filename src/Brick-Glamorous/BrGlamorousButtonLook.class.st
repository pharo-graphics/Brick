Class {
	#name : #BrGlamorousButtonLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousButtonLook >> initialize [
	super initialize.
	
	self addAll: {
		BrGlamorousButtonExteriorRectangularLook new.
		BrGlamorousButtonLabelLook
	}
]
