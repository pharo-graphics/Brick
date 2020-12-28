Class {
	#name : #BrGlamorousSpaceTabIconLook,
	#superclass : #BrIconLook,
	#category : #'Brick-Glamorous-Tabs - Space'
}

{ #category : #updating }
BrGlamorousSpaceTabIconLook >> updateIcon [
	self icon margin: (self icon margin + (BlInsets top: 2)).
	super updateIcon.
]
