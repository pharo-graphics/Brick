Class {
	#name : #BrGlamorousInputFieldLook,
	#superclass : #BrGlamorousEditorLook,
	#category : 'Brick-Glamorous-Editor'
}

{ #category : #initialization }
BrGlamorousInputFieldLook >> initializeLook [
	super initializeLook.
		
	self widgetContent
		constraintsDo: [ :c | 
			c vertical fitContent. 
			c horizontal fitContent.		
			c padding: (BlInsets top: 1 left: 5 bottom: 1 right: 5 ) ]
]
