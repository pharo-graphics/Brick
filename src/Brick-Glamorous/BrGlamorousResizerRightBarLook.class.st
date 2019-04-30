Class {
	#name : #BrGlamorousResizerRightBarLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous'
}

{ #category : #'as yet unclassified' }
BrGlamorousResizerRightBarLook >> initialize [
	super initialize.
	changes
		add:
			(#(widget background)
				asBrLookPropertyChangeWithValue: [ BrGlamorousColors editorBorderColor alpha: 0.5 ]).
	changes
		add:
			(#(widget geometry)
				asBrLookPropertyChangeWithValue: [ BlRectangle cornerRadius: 2 ])
]

{ #category : #initialization }
BrGlamorousResizerRightBarLook >> initializeLook [
	super initializeLook.
	self widget
		constraintsDo: [ :c | 
			c ignoreByLayout.
			c vertical exact: 70.
			c horizontal exact: 4.
			c ignored vertical alignCenter.
			c ignored horizontal alignRight.
			c margin: (BlInsets right: 4) ]
]
