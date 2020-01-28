Class {
	#name : #BrGlamorousTooltipLook2,
	#superclass : #BrTooltipLook2,
	#category : #'Brick-Glamorous-Tooltip'
}

{ #category : #initialization }
BrGlamorousTooltipLook2 >> initialize [
	super initialize.
	self add: BrGlamorousAnchoredLook
]
