Class {
	#name : #BrGlamorousResizerLook,
	#superclass : #BrResizerLook,
	#category : #'Brick-Glamorous-Resizer'
}

{ #category : #initialization }
BrGlamorousResizerLook >> initialize [
	super initialize.
	
	self add: (BrResizerInteractiveLook new
		top: [ :aWidget | aWidget constraintsDo: [ :c |
			c ignored horizontal alignCenter.
			c ignored vertical alignTop ] ];
		bottom: [ :aWidget | aWidget constraintsDo: [ :c |
			c ignored horizontal alignCenter.
			c ignored vertical alignBottom ] ];
		horizontal: [ :aWidget | aWidget width: 50; height: 5 ]).
]

{ #category : #initialization }
BrGlamorousResizerLook >> initializeLook [
	super initializeLook.
	
	self widget
		background: (Color gray alpha: 0.5);
		geometry: (BlRectangle cornerRadius: 3)
]
