Class {
	#name : #BrGlamorousResizerRightBarLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous'
}

{ #category : #initialization }
BrGlamorousResizerRightBarLook >> initializeLook [
	super initializeLook.
	
	self widget background: (BrGlamorousColors editorBorderColor alpha: 0.5).
	self widget geometry: (BlRectangle cornerRadius: 2).
	self widget constraintsDo: [ :c |
		c ignoreByLayout.
		c vertical exact: 70.
		c horizontal exact: 4.
		c ignored vertical alignCenter.
		c ignored horizontal alignRight.
		c margin: (BlInsets right: 4) ]
]
