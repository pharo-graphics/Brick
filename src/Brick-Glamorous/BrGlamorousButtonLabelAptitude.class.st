"
I define how a label looks inside of the glamorous button, for example font size, family name, weight etc
"
Class {
	#name : #BrGlamorousButtonLabelAptitude,
	#superclass : #BrTextLabelAptitude,
	#instVars : [
		'selectedColor',
		'labelLook',
		'hoveredColor',
		'defaultColor',
		'pressedColor'
	],
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #accessing }
BrGlamorousButtonLabelAptitude >> defaultColor [
	^ defaultColor
]

{ #category : #accessing }
BrGlamorousButtonLabelAptitude >> defaultColor: aPaint [
	defaultColor := aPaint.
	labelLook default foreground: defaultColor
]

{ #category : #accessing }
BrGlamorousButtonLabelAptitude >> hoveredColor [
	^ hoveredColor
]

{ #category : #accessing }
BrGlamorousButtonLabelAptitude >> hoveredColor: aPaint [
	hoveredColor := aPaint.
	labelLook hovered foreground: hoveredColor
]

{ #category : #initialization }
BrGlamorousButtonLabelAptitude >> initialize [
	super initialize.

	defaultColor := BrGlamorousColors defaultButtonTextColor.
	selectedColor := BrGlamorousColors hoveredButtonTextColor.
	hoveredColor := BrGlamorousColors hoveredButtonTextColor.
	pressedColor := BrGlamorousColors pressedButtonTextColor.

	self
		weight: 400;
		fontName: 'Source Sans Pro'.

	labelElement addAptitude: (BrSizeAdjustmentAptitude new
		mini: [ :aStyle | aStyle fontSizeEm: 0.55 ];
		tiny: [ :aStyle | aStyle fontSizeEm: 0.7 ];
		small: [ :aStyle | aStyle fontSizeEm: 0.85 ];
		normal: [ :aStyle | aStyle fontSizeEm: 1.0 ];
		large: [ :aStyle | aStyle fontSizeEm: 1.15 ];
		huge: [ :aStyle | aStyle fontSizeEm: 1.55 ]).

	self add: (labelLook := BrStyleCommonAptitude new
		@ labelElement;
		default: [ :aStyle | aStyle foreground: defaultColor ];
		hovered: [ :aStyle | aStyle foreground: hoveredColor ];
		pressed: [ :aStyle | aStyle foreground: pressedColor ];
		disabled: [ :aStyle | aStyle foreground: BrGlamorousColors disabledButtonTextColor ];
		selected: [ :aStyle | aStyle foreground: selectedColor ])
]

{ #category : #accessing }
BrGlamorousButtonLabelAptitude >> pressedColor [
	^ pressedColor
]

{ #category : #accessing }
BrGlamorousButtonLabelAptitude >> pressedColor: aPaint [
	pressedColor := aPaint.
	labelLook pressed foreground: pressedColor
]

{ #category : #accessing }
BrGlamorousButtonLabelAptitude >> selectedColor [
	^ selectedColor
]

{ #category : #accessing }
BrGlamorousButtonLabelAptitude >> selectedColor: aPaint [
	selectedColor := aPaint.
	labelLook selected foreground: selectedColor
]
