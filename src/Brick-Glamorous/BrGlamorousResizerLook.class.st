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
		horizontal: [ :aWidget | aWidget constraintsDo: [ :c | c horizontal matchParent. c ignored horizontal weight: 0.4 ]; height: 3 ]).
]

{ #category : #initialization }
BrGlamorousResizerLook >> initializeLook [
	super initializeLook.
	
	self widget
		background: (Color gray alpha: 0.4);
		geometry: (BlRectangle cornerRadius: 2)
]
