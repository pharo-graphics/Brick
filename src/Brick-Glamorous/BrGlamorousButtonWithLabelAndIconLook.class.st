Class {
	#name : #BrGlamorousButtonWithLabelAndIconLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousButtonWithLabelAndIconLook >> initialize [
	super initialize.
	
	self addAll: {
		BrGlamorousButtonExteriorLook new.
		BrGlamorousButtonRectangularLook new.
		BrGlamorousButtonLabelLook new.
		BrGlamorousButtonIconLook new.
	}
]
