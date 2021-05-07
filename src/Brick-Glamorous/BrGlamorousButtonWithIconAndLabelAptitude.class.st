Class {
	#name : #BrGlamorousButtonWithIconAndLabelAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousButtonWithIconAndLabelAptitude >> initialize [
	super initialize.
	
	self addAll: {
		BrGlamorousButtonExteriorAptitude new.
		BrGlamorousButtonRectangularAptitude new.
		BrGlamorousButtonIconAptitude new.
		BrGlamorousButtonLabelAptitude new.
	}
]
