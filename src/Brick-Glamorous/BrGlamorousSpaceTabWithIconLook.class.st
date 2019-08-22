Class {
	#name : #BrGlamorousSpaceTabWithIconLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Tabs - Space'
}

{ #category : #initialization }
BrGlamorousSpaceTabWithIconLook >> initialize [
	super initialize.
	
	self add: BrIconLook new.
	self add: BrGlamorousSpaceTabBasicLook new.
]
