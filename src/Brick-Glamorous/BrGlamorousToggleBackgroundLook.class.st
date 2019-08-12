Class {
	#name : #BrGlamorousToggleBackgroundLook,
	#superclass : #BrToggleLook,
	#category : #'Brick-Glamorous-Toggle'
}

{ #category : #initialization }
BrGlamorousToggleBackgroundLook >> initialize [
	super initialize.
	self
		add:
			(BrInteractiveCommonLook new
				style:
						[ :aStyler | aStyler default: [ :aWidget | self request: BrToggleStateRequest new ] ];
				yourself)
]

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
