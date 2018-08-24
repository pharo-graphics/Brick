"
I define how a label looks inside of the glamorous button, for example font size, family name, weight etc
"
Class {
	#name : #BrGlamorousButtonLabelLook,
	#superclass : #BrLabelLook,
	#category : 'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousButtonLabelLook >> initialize [
	super initialize.
	
	self
		fontSize: 14;
		weight: 400;
		foreground: (Color black alpha: 0.65);
		fontName: 'Source Sans Pro'.
		
	self labelDo: [ :aLabelElement | aLabelElement boundsBaseline ]
]
