Class {
	#name : #BrGlamorousToggleWithLabelLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Toggle'
}

{ #category : #initialization }
BrGlamorousToggleWithLabelLook >> initialize [
	super initialize.
	
	self add: BrGlamorousTextLabelLook new.
	self add: (BrGlamorousToggleRectangularLook new cornerRadius: 0).
	self add: BrGlamorousToggleBackgroundLook new.
	self add: BrGlamorousButtonWithLabelTooltipLook new
]
