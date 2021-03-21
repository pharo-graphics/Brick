Class {
	#name : #BrGlamorousButtonWithLabelLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousButtonWithLabelLook >> initialize [
	super initialize.
	
	self addAll: {
		BrGlamorousButtonExteriorLook new.
		BrGlamorousButtonRectangularLook new.
		BrGlamorousButtonLabelLook new.
	}
]
