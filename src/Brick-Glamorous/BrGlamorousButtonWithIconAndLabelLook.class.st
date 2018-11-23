Class {
	#name : #BrGlamorousButtonWithIconAndLabelLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousButtonWithIconAndLabelLook >> initialize [
	super initialize.
	
	self addAll: {
		BrGlamorousButtonExteriorRectangularLook new.
		BrGlamorousButtonIconLook new.
		BrGlamorousButtonLabelLook new.
	}
]
