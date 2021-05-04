Class {
	#name : #BrGlamorousButtonWithIconCircularAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousButtonWithIconCircularAptitude >> initialize [
	super initialize.
	self
		addAll:
			{BrGlamorousButtonExteriorAptitude new.
			BrGlamorousButtonCircularAptitude new.
			BrGlamorousButtonIconAptitude new.
			BrGlamorousButtonWithLabelTooltipAptitude new}
]
