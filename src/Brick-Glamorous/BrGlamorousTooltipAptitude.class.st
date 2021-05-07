Class {
	#name : #BrGlamorousTooltipAptitude,
	#superclass : #BrTooltipAptitude,
	#category : #'Brick-Glamorous-Tooltip'
}

{ #category : #initialization }
BrGlamorousTooltipAptitude >> initialize [
	super initialize.
	self add: BrGlamorousAnchoredAptitude
]
