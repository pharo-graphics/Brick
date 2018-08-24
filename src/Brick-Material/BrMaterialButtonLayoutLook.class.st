"
I define basic layout related properties of material buttons such as padding or resizing strategies
"
Class {
	#name : #BrMaterialButtonLayoutLook,
	#superclass : #BrLook,
	#category : 'Brick-Material-Core'
}

{ #category : #initialization }
BrMaterialButtonLayoutLook >> initializeLook [
	super initializeLook.
	
	widget layout: BlLinearLayout horizontal alignCenter.
	widget constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent.
		c padding: (BlInsets all: 6) ]
]
