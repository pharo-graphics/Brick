Class {
	#name : #BrGlamorousSpaceTabIconAptitude,
	#superclass : #BrIconAptitude,
	#category : #'Brick-Glamorous-Tabs - Space'
}

{ #category : #updating }
BrGlamorousSpaceTabIconAptitude >> updateIcon [
	self icon margin: (self icon margin + (BlInsets top: 2)).
	super updateIcon.
]
