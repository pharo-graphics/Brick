Class {
	#name : #BrGlamorousInputFieldSpacingLook,
	#superclass : #BrGlamorousEditorSpacingLook,
	#category : #'Brick-Glamorous-Editor'
}

{ #category : #initialization }
BrGlamorousInputFieldSpacingLook >> initializeLook [
	super initializeLook.
		
	self widgetContent
		constraintsDo: [ :c | 
			c vertical fitContent. 
			c horizontal fitContent.		
			c padding: (BlInsets top: 5 left: 5 bottom: 5 right: 5 ) ]
]
