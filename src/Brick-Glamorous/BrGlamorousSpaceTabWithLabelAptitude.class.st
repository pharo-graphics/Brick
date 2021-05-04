Class {
	#name : #BrGlamorousSpaceTabWithLabelAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Glamorous-Tabs - Space'
}

{ #category : #initialization }
BrGlamorousSpaceTabWithLabelAptitude >> initialize [
	super initialize.
	
	self add: (BrGlamorousTextLabelAptitude new foreground: Color black).
	self add: BrGlamorousSpaceTabBasicAptitude new.
]
