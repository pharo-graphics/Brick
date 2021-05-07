Class {
	#name : #BrGlamorousButtonWithLabelAndIconAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousButtonWithLabelAndIconAptitude >> initialize [
	super initialize.
	
	self addAll: {
		BrGlamorousButtonExteriorAptitude new.
		BrGlamorousButtonRectangularAptitude new.
		BrGlamorousButtonLabelAptitude new.
		BrGlamorousButtonIconAptitude new.
	}
]
