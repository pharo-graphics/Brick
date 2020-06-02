Class {
	#name : #BrGlamorousTextLabelLook,
	#superclass : #BrTextLabelLook,
	#instVars : [
		'normalFontSize'
	],
	#category : #'Brick-Glamorous-Label'
}

{ #category : #'api - text font' }
BrGlamorousTextLabelLook >> fontSize: aNumber [
	normalFontSize := aNumber.
	super fontSize: aNumber.
]

{ #category : #private }
BrGlamorousTextLabelLook >> fontSizeBy: aShift [
	| aNumber |
	aNumber := normalFontSize + aShift max: 1.
	super fontSize: aNumber.
]

{ #category : #initialization }
BrGlamorousTextLabelLook >> initialize [
	super initialize.

	normalFontSize := 14.

	self fontName: 'Source Sans Pro'.
	self fontSize: normalFontSize.
		
	self add: (BrSizeAdjustmentLook new
		huge: [ self fontSizeBy: 6 ];
		large: [ self fontSizeBy: 2 ];
		default: [ self fontSize: normalFontSize ];
		small: [ self fontSizeBy: -2 ];
		tiny: [ self fontSizeBy: -4 ];
		mini: [ self fontSizeBy: -6 ])
]
