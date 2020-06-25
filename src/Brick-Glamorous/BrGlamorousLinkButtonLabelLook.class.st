"
I define how a link (with a label) looks inside of a text, for example font size, family name, weight etc
"
Class {
	#name : #BrGlamorousLinkButtonLabelLook,
	#superclass : #BrTextLabelLook,
	#instVars : [
		'normalFontSize'
	],
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #'api - text font' }
BrGlamorousLinkButtonLabelLook >> fontSize: aNumber [
	normalFontSize := aNumber.
	super fontSize: aNumber.
]

{ #category : #private }
BrGlamorousLinkButtonLabelLook >> fontSizeBy: aShift [
	| aNumber |
	aNumber := normalFontSize + aShift max: 1.
	super fontSize: aNumber.
]

{ #category : #initialization }
BrGlamorousLinkButtonLabelLook >> initialize [
	super initialize.

	normalFontSize := 14.

	self
		weight: 400;
		glamorousCodeFont.
		
	self add: (BrSizeAdjustmentLook new
		default: [ self fontSize: normalFontSize ];
		huge: [ self fontSizeBy: 6 ];
		large: [ self fontSizeBy: 2 ];
		small: [ self fontSizeBy: -2 ];
		tiny: [ self fontSizeBy: -6 ]).

	self add: (BrInteractiveCommonLook new
		default: [ self foreground: Color black ];
		hovered: [ self foreground: BrGlamorousColors defaultButtonBackgroundColor ];
		pressed: [ self foreground: BrGlamorousColors defaultButtonBackgroundColor ];
		disabled: [ self foreground: BrGlamorousColors disabledButtonTextColor ])
]
