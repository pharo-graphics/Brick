Class {
	#name : #BrGlamorousTabLabelLook,
	#superclass : #BrLabelLook,
	#category : #'Brick-Glamorous-Tabs - Support'
}

{ #category : #initialization }
BrGlamorousTabLabelLook >> initialize [
	super initialize.

	self
		fontSize: 14;
		weight: 400;
		foreground: Color black;
		fontName: 'Source Sans Pro'.

	self labelDo: [ :aLabelElement | aLabelElement boundsBaseline ]
]
