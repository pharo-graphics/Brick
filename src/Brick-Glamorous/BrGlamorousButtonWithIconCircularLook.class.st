Class {
	#name : #BrGlamorousButtonWithIconCircularLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousButtonWithIconCircularLook >> initialize [
	super initialize.
	self
		addAll:
			{BrGlamorousButtonExteriorLook new.
			BrGlamorousButtonCircularLook new.
			BrGlamorousButtonIconLook new.
			BrGlamorousButtonWithLabelTooltipLook new}
]
