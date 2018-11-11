Class {
	#name : #BrGlamorousBadgeWithLabelLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Badge'
}

{ #category : #initialization }
BrGlamorousBadgeWithLabelLook >> initialize [
	super initialize.

	self add: BrGlamorousBadgeLook new.
	self add: (BrGlamorousLabelLook new
		foreground: Color white;
		fontSize: 16;
		padding: (BlInsets all: 4))
]
