Class {
	#name : #BrGlamorousSpaceTabWithIconAndLabelAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Glamorous-Tabs - Space'
}

{ #category : #initialization }
BrGlamorousSpaceTabWithIconAndLabelAptitude >> initialize [
	super initialize.
	
	self add: BrGlamorousSpaceTabIconAptitude new.
	self add: (BrGlamorousTextLabelAptitude new foreground: Color black).
	self add: BrGlamorousSpaceTabBasicAptitude new.
]
