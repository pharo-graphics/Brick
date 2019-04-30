"
I define basic layout related properties of material buttons such as padding or resizing strategies
"
Class {
	#name : #BrMaterialButtonLayoutLook,
	#superclass : #BrLook,
	#category : #'Brick-Material-Buttons - Support'
}

{ #category : #'as yet unclassified' }
BrMaterialButtonLayoutLook >> initialize [
	super initialize.
	changes
		add:
			(#(widget layout)
				asBrLookPropertyChangeWithValue: [ BlLinearLayout horizontal alignCenter ])
]

{ #category : #initialization }
BrMaterialButtonLayoutLook >> initializeLook [
	super initializeLook.
	self widget
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent.
			c padding: (BlInsets all: 6) ]
]
