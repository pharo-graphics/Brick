Class {
	#name : #BrGlamorousToggleWithIconAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Glamorous-Toggle'
}

{ #category : #initialization }
BrGlamorousToggleWithIconAptitude >> initialize [
	super initialize.
	
	self add: BrIconAptitude new.
	self add: (BrGlamorousToggleRectangularAptitude new cornerRadius: 0).
	self add: BrGlamorousToggleBackgroundAptitude new.
	self add: BrGlamorousButtonWithLabelTooltipAptitude new
]
