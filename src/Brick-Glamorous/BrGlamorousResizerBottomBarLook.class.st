Class {
	#name : #BrGlamorousResizerBottomBarLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous'
}

{ #category : #initialization }
BrGlamorousResizerBottomBarLook >> initializeLook [
	super initializeLook.
	
	self widget background: (BrGlamorousColors editorBorderColor alpha: 0.5).
	self widget geometry: (BlRectangle cornerRadius: 2).
	self widget constraintsDo: [ :c |
		c ignoreByLayout.
		c vertical exact: 4.
		c horizontal exact: 70.
		c ignored vertical alignBottom.
		c ignored horizontal alignCenter.
		c margin: (BlInsets bottom: 4) ]
]
