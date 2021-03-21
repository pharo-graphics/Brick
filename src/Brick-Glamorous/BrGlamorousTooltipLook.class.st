Class {
	#name : #BrGlamorousTooltipLook,
	#superclass : #BrTooltipLook,
	#category : #'Brick-Glamorous-Tooltip'
}

{ #category : #initialization }
BrGlamorousTooltipLook >> initialize [
	super initialize.
	self add: BrGlamorousAnchoredLook
]
