Class {
	#name : #BrGlamorousSpaceTabWithIconAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Glamorous-Tabs - Space'
}

{ #category : #initialization }
BrGlamorousSpaceTabWithIconAptitude >> initialize [
	super initialize.
	
	self add: BrIconAptitude new.
	self add: BrGlamorousSpaceTabBasicAptitude new.
]
