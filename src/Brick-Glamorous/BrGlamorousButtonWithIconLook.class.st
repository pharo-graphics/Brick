Class {
	#name : #BrGlamorousButtonWithIconLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousButtonWithIconLook >> initialize [
	super initialize.
	
	self addAll: {
		BrGlamorousButtonExteriorRectangularLook new.
		BrGlamorousButtonIconLook new
	}
]
