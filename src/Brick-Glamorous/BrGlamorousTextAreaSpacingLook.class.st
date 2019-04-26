Class {
	#name : #BrGlamorousTextAreaSpacingLook,
	#superclass : #BrGlamorousEditorSpacingLook,
	#category : #'Brick-Glamorous-Editor'
}

{ #category : #initialization }
BrGlamorousTextAreaSpacingLook >> initializeLook [
	super initializeLook.

	self widget
		constraintsDo: [ :c | 
			c vertical fitContent. 
			c horizontal matchParent.	
			c padding: (BlInsets top: 10 left: 5 bottom: 10 right: 5 ) ]
]
