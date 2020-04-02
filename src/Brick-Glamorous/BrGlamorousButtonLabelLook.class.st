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

	self add: (BrSizeAdjustmentLook new
		default: [ self
			foreground: BrGlamorousColors defaultButtonTextColor;
			fontSize: 14 ];
		huge: [ self fontSize: 20 ];
		large: [ self fontSize: 16 ];
		small: [ self fontSize: 12 ];
		tiny: [ self fontSize: 10 ]).

	self add: (BrInteractiveCommonLook new
		default: [ self foreground: BrGlamorousColors defaultButtonTextColor ];
		hovered: [ self foreground: BrGlamorousColors hoveredButtonTextColor ];
		pressed: [ self foreground: BrGlamorousColors pressedButtonTextColor ];
		disabled: [ self foreground: BrGlamorousColors disabledButtonTextColor ];
		selected: [ self foreground: selectedColor ])
]

{ #category : #accessing }
BrGlamorousButtonLabelLook >> selectedColor [
	^ selectedColor
]

{ #category : #accessing }
BrGlamorousButtonLabelLook >> selectedColor: aPaint [
	selectedColor := aPaint
]
