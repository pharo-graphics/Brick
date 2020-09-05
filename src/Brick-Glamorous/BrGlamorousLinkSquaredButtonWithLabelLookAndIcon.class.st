Class {
	#name : #BrGlamorousLinkSquaredButtonWithLabelLookAndIcon,
	#superclass : #BrGlamorousLinkSquaredButtonWithLabelLook,
	#traits : 'TBlTextStyleable',
	#classTraits : 'TBlTextStyleable classTrait',
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousLinkSquaredButtonWithLabelLookAndIcon >> initialize [

	super initialize.
	self addAll: { BrGlamorousButtonIconLook new. }.
]
