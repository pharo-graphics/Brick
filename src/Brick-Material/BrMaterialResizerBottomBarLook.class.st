Class {
	#name : #BrMaterialResizerBottomBarLook,
	#superclass : #BrLook,
	#category : 'Brick-Material-Collection'
}

{ #category : #'as yet unclassified' }
BrMaterialResizerBottomBarLook >> initialize [
	super initialize.
	changes
		add:
			(#(widget background)
				asBrLookPropertyChangeWithValue: [ Color gray alpha: 0.5 ]).
	changes
		add:
			(#(widget geometry)
				asBrLookPropertyChangeWithValue: [ BlRectangle cornerRadius: 2 ])
]

{ #category : #initialization }
BrMaterialResizerBottomBarLook >> initializeLook [
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
