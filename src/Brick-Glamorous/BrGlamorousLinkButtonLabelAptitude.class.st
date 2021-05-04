"
I define how a link (with a label) looks inside of a text, for example font size, family name, weight etc
"
Class {
	#name : #BrGlamorousLinkButtonLabelAptitude,
	#superclass : #BrTextLabelAptitude,
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #initialization }
BrGlamorousLinkButtonLabelAptitude >> initialize [
	super initialize.

	self
		weight: 400;
		glamorousCodeFont.
		
	"self add: (labelLook := BrStyleCommonLook new
		@ labelElement;
		default: [ :aStyle | aStyle foreground: Color black ];
		hovered: [ :aStyle | aStyle foreground: BrGlamorousColors defaultButtonBackgroundColor ];
		pressed: [ :aStyle | aStyle foreground: BrGlamorousColors defaultButtonBackgroundColor ];
		disabled: [ :aStyle | aStyle foreground: BrGlamorousColors disabledButtonTextColor ]).

	self add: (BrInteractiveCommonLook new
		default: [ self foreground: Color black ];
		hovered: [ self foreground: BrGlamorousColors defaultButtonBackgroundColor ];
		pressed: [ self foreground: BrGlamorousColors defaultButtonBackgroundColor ];
		disabled: [ self foreground: BrGlamorousColors disabledButtonTextColor ])"
]
