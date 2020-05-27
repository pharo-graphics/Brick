Class {
	#name : #BrGlamorousTextLabelLook,
	#superclass : #BrTextLabelLook,
	#category : #'Brick-Glamorous-Label'
}

{ #category : #initialization }
BrGlamorousTextLabelLook >> initialize [
	super initialize.

	self fontName: 'Source Sans Pro'.
		
	self add: (BrSizeAdjustmentLook new
		huge: [ self fontSize: 20 ];
		large: [ self fontSize: 16 ];
		default: [ self fontSize: 14 ];
		small: [ self fontSize: 12 ];
		tiny: [ self fontSize: 10 ];
		mini: [ self fontSize: 8 ])
]
