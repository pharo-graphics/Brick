"
I define how a link (with a label) looks inside of a text, for example font size, family name, weight etc
"
Class {
	#name : #BrGlamorousLinkButtonLabelLook,
	#superclass : #BrTextLabelLook,
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #initialization }
BrGlamorousLinkButtonLabelLook >> initialize [
	super initialize.

	self
		weight: 400;
		fontName: 'Source Sans Pro'.

	self add: (BrInteractiveLook new style: [ :aStyler |
		aStyler default: [ self
			foreground: Color black;
			fontSize: 14;
			glamorousCodeFont  ].
		aStyler huge: [ self fontSize: 20 ].
		aStyler large: [ self fontSize: 16 ].
		aStyler small: [ self fontSize: 12 ].
		aStyler tiny: [ self fontSize: 10 ].
		aStyler hovered: [ self 
			foreground: BrGlamorousColors defaultButtonBackgroundColor ].
		aStyler pressed: [ self 
			foreground: BrGlamorousColors pressedButtonTextColor ].
		aStyler disabled: [ self 
			foreground: BrGlamorousColors disabledButtonTextColor ] ])
]
