Class {
	#name : #BrGlamorousButtonWithIconAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousButtonWithIconAptitude >> initialize [
	super initialize.
	
	self addAll: {
		BrGlamorousButtonExteriorAptitude new.
		BrGlamorousButtonRectangularAptitude new.
		BrGlamorousButtonIconAptitude new.
		BrGlamorousButtonWithLabelTooltipAptitude new
	}
]
