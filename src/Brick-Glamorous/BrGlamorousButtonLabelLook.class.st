"
I define how a label looks inside of the glamorous button, for example font size, family name, weight etc
"
Class {
	#name : #BrGlamorousButtonLabelLook,
	#superclass : #BrTextLabelLook,
	#instVars : [
		'selectedColor',
		'labelLook',
		'hoveredColor',
		'defaultColor'
	],
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #accessing }
BrGlamorousButtonLabelLook >> defaultColor [
	^ defaultColor
]

{ #category : #accessing }
BrGlamorousButtonLabelLook >> defaultColor: aPaint [
	defaultColor := aPaint.
	labelLook default foreground: defaultColor
]

{ #category : #accessing }
BrGlamorousButtonLabelLook >> hoveredColor [
	^ hoveredColor
]

{ #category : #accessing }
BrGlamorousButtonLabelLook >> hoveredColor: aPaint [
	hoveredColor := aPaint.
	labelLook hovered foreground: selectedColor
]

{ #category : #initialization }
BrGlamorousButtonLabelLook >> initialize [
	super initialize.

	defaultColor := BrGlamorousColors defaultButtonTextColor.
	selectedColor := BrGlamorousColors hoveredButtonTextColor.
	hoveredColor := BrGlamorousColors hoveredButtonTextColor.

	self
		weight: 400;
		fontName: 'Source Sans Pro'.

	labelElement addLook: (BrSizeAdjustmentLook new
		normal: [ :aStyle | aStyle fontSize: 14 ];
		huge: [ :aStyle | aStyle fontSize: 20 ];
		large: [ :aStyle | aStyle fontSize: 16 ];
		small: [ :aStyle | aStyle fontSize: 12 ];
		tiny: [ :aStyle | aStyle fontSize: 10 ];
		mini: [ :aStyle | aStyle fontSize: 8 ]).

	self add: (labelLook := BrStyleCommonLook new
		@ labelElement;
		default: [ :aStyle | aStyle foreground: defaultColor ];
		hovered: [ :aStyle | aStyle foreground: hoveredColor ];
		pressed: [ :aStyle | aStyle foreground: BrGlamorousColors pressedButtonTextColor ];
		disabled: [ :aStyle | aStyle foreground: BrGlamorousColors disabledButtonTextColor ];
		selected: [ :aStyle | aStyle foreground: selectedColor ])
]

{ #category : #accessing }
BrGlamorousButtonLabelLook >> selectedColor [
	^ selectedColor
]

{ #category : #accessing }
BrGlamorousButtonLabelLook >> selectedColor: aPaint [
	selectedColor := aPaint.
	labelLook selected foreground: selectedColor
]
