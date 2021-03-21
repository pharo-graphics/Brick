Class {
	#name : #BrGlamorousButtonWithIconAndLabelLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousButtonWithIconAndLabelLook >> initialize [
	super initialize.
	
	self addAll: {
		BrGlamorousButtonExteriorLook new.
		BrGlamorousButtonRectangularLook new.
		BrGlamorousButtonIconLook new.
		BrGlamorousButtonLabelLook new.
	}
]
