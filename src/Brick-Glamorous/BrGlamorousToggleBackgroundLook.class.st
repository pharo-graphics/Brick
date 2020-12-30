Class {
	#name : #BrGlamorousToggleBackgroundLook,
	#superclass : #BrToggleLook,
	#category : #'Brick-Glamorous-Toggle - Support'
}

{ #category : #initialization }
BrGlamorousToggleBackgroundLook >> initialize [
	super initialize.
	
	self
		activated: [ :aStyle | aStyle background: BrGlamorousColors defaultButtonBorderColor lighter ]
]
