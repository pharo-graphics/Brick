Class {
	#name : #BrGlamorousResizerBottomBarLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous'
}

{ #category : #'as yet unclassified' }
BrGlamorousResizerBottomBarLook >> initialize [
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
BrGlamorousResizerBottomBarLook >> initializeLook [
	super initializeLook.
	self widget
		constraintsDo: [ :c | 
			c ignoreByLayout.
			c vertical exact: 4.
			c horizontal exact: 70.
			c ignored vertical alignBottom.
			c ignored horizontal alignCenter.
			c margin: (BlInsets bottom: 4) ]
]
