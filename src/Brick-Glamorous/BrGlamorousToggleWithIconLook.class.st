Class {
	#name : #BrGlamorousToggleWithIconLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Toggle'
}

{ #category : #initialization }
BrGlamorousToggleWithIconLook >> initialize [
	super initialize.
	
	self add: BrIconLook new.
	self add: (BrGlamorousToggleRectangularLook new cornerRadius: 0).
	self add: BrGlamorousToggleBackgroundLook new.
	self add: BrGlamorousButtonWithLabelTooltipLook new
]
