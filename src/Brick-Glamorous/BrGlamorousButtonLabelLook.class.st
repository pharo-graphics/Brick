"
I define how a label looks inside of the glamorous button, for example font size, family name, weight etc
"
Class {
	#name : #BrGlamorousButtonLabelLook,
	#superclass : #BrTextLabelLook,
	#instVars : [
		'selectedColor'
	],
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #initialization }
BrGlamorousButtonLabelLook >> initialize [
	super initialize.

	selectedColor := BrGlamorousColors hoveredButtonTextColor.

	self
		weight: 400;
		fontName: 'Source Sans Pro'.

	self add: (BrInteractiveLook new style: [ :aStyler |
		aStyler default: [ self
			foreground: BrGlamorousColors defaultButtonTextColor;
			fontSize: 14 ].
		aStyler huge: [ self fontSize: 20 ].
		aStyler large: [ self fontSize: 16 ].
		aStyler small: [ self fontSize: 12 ].
		aStyler tiny: [ self fontSize: 10 ].
		aStyler hovered: [ self foreground: BrGlamorousColors hoveredButtonTextColor ].
		aStyler pressed: [ self foreground: BrGlamorousColors pressedButtonTextColor ].
		aStyler disabled: [ self foreground: BrGlamorousColors disabledButtonTextColor ].
		aStyler selected: [ self foreground: selectedColor ] ])
]

{ #category : #accessing }
BrGlamorousButtonLabelLook >> selectedColor [
	^ selectedColor
]

{ #category : #accessing }
BrGlamorousButtonLabelLook >> selectedColor: aPaint [
	selectedColor := aPaint
]
