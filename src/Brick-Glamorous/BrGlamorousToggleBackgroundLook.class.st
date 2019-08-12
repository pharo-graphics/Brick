Class {
	#name : #BrGlamorousToggleBackgroundLook,
	#superclass : #BrToggleLook,
	#category : #'Brick-Glamorous-Toggle'
}

{ #category : #'event handling' }
BrGlamorousToggleBackgroundLook >> toggleActivated [
	super toggleActivated.
	widget background: BrGlamorousColors pressedButtonBorderColor
]

{ #category : #'event handling' }
BrGlamorousToggleBackgroundLook >> toggleDeactivated [
	super toggleDeactivated.
	widget background: BrGlamorousColors defaultButtonBackgroundColor
]
