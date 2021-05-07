Class {
	#name : #BrGlamorousToggleBackgroundAptitude,
	#superclass : #BrToggleAptitude,
	#category : #'Brick-Glamorous-Toggle - Support'
}

{ #category : #initialization }
BrGlamorousToggleBackgroundAptitude >> initialize [
	super initialize.
	
	self
		activated: [ :aStyle | aStyle background: BrGlamorousColors defaultButtonBorderColor lighter ]
]
