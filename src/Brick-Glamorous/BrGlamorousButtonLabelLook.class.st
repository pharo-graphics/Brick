"
I define how a label looks inside of the glamorous button, for example font size, family name, weight etc
"
Class {
	#name : #BrGlamorousButtonLabelLook,
	#superclass : #BrLabelLook,
	#pools : [
		'BrGlamorousColors'
	],
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousButtonLabelLook >> initialize [
	super initialize.
	
	self
		fontSize: 14;
		weight: 400;
		fontName: 'Source Sans Pro'.

	self labelDo: [ :aLabelElement | aLabelElement boundsBaseline ].
	
	self add: (BrInteractionLook new define: [ :aBuilder |
		aBuilder default: [ self foreground: BrGlamorousColors defaultButtonTextColor ].
		aBuilder hovered: [ self foreground: BrGlamorousColors hoveredButtonTextColor ].
		aBuilder pressed: [ self foreground: BrGlamorousColors pressedButtonTextColor ].
		aBuilder disabled: [ self foreground: BrGlamorousColors disabledButtonTextColor ] ])
]
