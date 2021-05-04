Class {
	#name : #BrGlamorousToggleWithLabelAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Glamorous-Toggle'
}

{ #category : #initialization }
BrGlamorousToggleWithLabelAptitude >> initialize [
	super initialize.
	
	self add: BrGlamorousTextLabelAptitude new.
	self add: (BrGlamorousToggleRectangularAptitude new cornerRadius: 0).
	self add: BrGlamorousToggleBackgroundAptitude new.
	self add: BrGlamorousButtonWithLabelTooltipAptitude new
]
