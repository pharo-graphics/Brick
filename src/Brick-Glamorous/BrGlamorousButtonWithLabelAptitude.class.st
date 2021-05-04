Class {
	#name : #BrGlamorousButtonWithLabelAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousButtonWithLabelAptitude >> initialize [
	super initialize.
	
	self addAll: {
		BrGlamorousButtonExteriorAptitude new.
		BrGlamorousButtonRectangularAptitude new.
		BrGlamorousButtonLabelAptitude new.
	}
]
