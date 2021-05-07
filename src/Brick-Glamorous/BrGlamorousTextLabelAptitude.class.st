Class {
	#name : #BrGlamorousTextLabelAptitude,
	#superclass : #BrTextLabelAptitude,
	#category : #'Brick-Glamorous-Label'
}

{ #category : #initialization }
BrGlamorousTextLabelAptitude >> initialize [
	super initialize.

	self fontName: 'Source Sans Pro'.

	labelElement addAptitude: (BrSizeAdjustmentAptitude new
		mini: [ :aStyle | aStyle fontSizeEm: 0.55 ];
		tiny: [ :aStyle | aStyle fontSizeEm: 0.7 ];
		small: [ :aStyle | aStyle fontSizeEm: 0.85 ];
		normal: [ :aStyle | aStyle fontSizeEm: 1.0 ];
		large: [ :aStyle | aStyle fontSizeEm: 1.15 ];
		huge: [ :aStyle | aStyle fontSizeEm: 1.55 ])
]
