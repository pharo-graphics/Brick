Class {
	#name : #BrGlamorousToggleRectangularAptitude,
	#superclass : #BrStyleCommonAptitude,
	#instVars : [
		'cornerRadius'
	],
	#category : #'Brick-Glamorous-Toggle - Support'
}

{ #category : #accessing }
BrGlamorousToggleRectangularAptitude >> cornerRadius [
	^ cornerRadius
]

{ #category : #accessing }
BrGlamorousToggleRectangularAptitude >> cornerRadius: aNumber [
	cornerRadius := aNumber.
	self default geometry: (BlRoundedRectangleGeometry cornerRadius: self cornerRadius)
]

{ #category : #initialization }
BrGlamorousToggleRectangularAptitude >> initialize [
	super initialize.

	cornerRadius := 4.

	self default geometry: (BlRoundedRectangleGeometry cornerRadius: self cornerRadius).
	
	self add: (BrSizeAdjustmentAptitude new
		mini: [ :aStyle |
			aStyle
				vExact: 12;
				padding: (BlInsets left: 4 right: 4) ];
		tiny: [ :aStyle |
			aStyle
				vExact: 16;
				padding: (BlInsets left: 6 right: 6) ];
		small: [ :aStyle | 
			aStyle
				vExact: 20;
				padding: (BlInsets left: 8 right: 8) ];
		normal: [ :aStyle | 
			aStyle
				vExact: 24;
				padding: (BlInsets left: 10 right: 10) ];
		large: [ :aStyle |
			aStyle
				vExact: 30;
				padding: (BlInsets left: 10 right: 10) ];
		huge: [ :aStyle |
			aStyle
				vExact: 48;
				padding: (BlInsets left: 16 right: 16) ]).

	self add: BrGlamorousToggleLayoutAptitude new
]
