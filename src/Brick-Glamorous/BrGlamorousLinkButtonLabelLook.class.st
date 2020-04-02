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
		glamorousCodeFont.
		
	self add: (BrSizeAdjustmentLook new
		default: [ self fontSize: 14 ];
		huge: [ self fontSize: 20 ];
		large: [ self fontSize: 16 ];
		small: [ self fontSize: 12 ];
		tiny: [ self fontSize: 10 ]).

	self add: (BrInteractiveCommonLook new
		default: [ self foreground: Color black ];
		hovered: [ self foreground: BrGlamorousColors defaultButtonBackgroundColor ];
		pressed: [ self foreground: BrGlamorousColors defaultButtonBackgroundColor ];
		disabled: [ self foreground: BrGlamorousColors disabledButtonTextColor ])
]
