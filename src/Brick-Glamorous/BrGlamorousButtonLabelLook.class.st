"
I define how a label looks inside of the glamorous button, for example font size, family name, weight etc
"
Class {
	#name : #BrGlamorousButtonLabelLook,
	#superclass : #BrLabelLook,
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #initialization }
BrGlamorousButtonLabelLook >> initialize [
	super initialize.

	self
		weight: 400;
		fontName: 'Source Sans Pro'.

	self add: (BrInteractiveLook new style: [ :aStyler |
		aStyler default: [ self
			foreground: BrGlamorousColors defaultButtonTextColor;
			fontSize: 14 ].
		aStyler large: [ self fontSize: 16 ].
		aStyler small: [ self fontSize: 12 ].
		aStyler tiny: [ self fontSize: 10 ].
		aStyler hovered: [ self foreground: BrGlamorousColors hoveredButtonTextColor ].
		aStyler pressed: [ self foreground: BrGlamorousColors pressedButtonTextColor ].
		aStyler disabled: [ self foreground: BrGlamorousColors disabledButtonTextColor ] ])
]
