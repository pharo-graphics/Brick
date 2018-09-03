"
I define how a label looks inside of the glamorous button, for example font size, family name, weight etc
"
Class {
	#name : #BrGlamorousButtonLabelLook,
	#superclass : #BrGlamorousLabelLook,
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #initialization }
BrGlamorousButtonLabelLook >> initialize [
	super initialize.
	
	self add: (BrInteractiveLook new style: [ :aStyler |
		aStyler default: [ self foreground: BrGlamorousColors defaultButtonTextColor ].
		aStyler hovered: [ self foreground: BrGlamorousColors hoveredButtonTextColor ].
		aStyler pressed: [ self foreground: BrGlamorousColors pressedButtonTextColor ].
		aStyler disabled: [ self foreground: BrGlamorousColors disabledButtonTextColor ] ])
]
