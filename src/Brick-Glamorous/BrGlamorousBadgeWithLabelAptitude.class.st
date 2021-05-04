Class {
	#name : #BrGlamorousBadgeWithLabelAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Glamorous-Badge'
}

{ #category : #initialization }
BrGlamorousBadgeWithLabelAptitude >> initialize [
	super initialize.

	self add: BrGlamorousBadgeAptitude new.
	self add: (BrGlamorousTextLabelAptitude new
		foreground: Color white;
		fontSize: 16;
		padding: (BlInsets all: 6))
]
