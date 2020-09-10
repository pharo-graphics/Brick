Class {
	#name : #BrGlamorousLinkSquaredButtonWithLabelAndIconLook,
	#superclass : #BrGlamorousLinkSquaredButtonWithLabelLook,
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousLinkSquaredButtonWithLabelAndIconLook >> initialize [

	super initialize.
	self addAll: { BrGlamorousButtonIconLook new. }.
]
