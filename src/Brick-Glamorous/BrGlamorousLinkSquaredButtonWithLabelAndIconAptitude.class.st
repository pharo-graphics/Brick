Class {
	#name : #BrGlamorousLinkSquaredButtonWithLabelAndIconAptitude,
	#superclass : #BrGlamorousLinkSquaredButtonWithLabelAptitude,
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousLinkSquaredButtonWithLabelAndIconAptitude >> initialize [

	super initialize.
	self addAll: { BrGlamorousButtonIconAptitude new. }.
]
