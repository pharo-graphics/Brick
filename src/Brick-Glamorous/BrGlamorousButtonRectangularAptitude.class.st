"
I define the rectangular exterior of the button
"
Class {
	#name : #BrGlamorousButtonRectangularAptitude,
	#superclass : #BrStyleCommonAptitude,
	#instVars : [
		'cornerRadius',
		'paddingScale',
		'heightScale'
	],
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #'instance creation' }
BrGlamorousButtonRectangularAptitude class >> paddingScale: aPaddingScale [
	^ self basicNew
		setPaddingScale: aPaddingScale;
		initialize
]

{ #category : #'instance creation' }
BrGlamorousButtonRectangularAptitude class >> paddingScale: aPaddingScale heightScale: aHeightScale [
	^ self basicNew
		setPaddingScale: aPaddingScale;
		setHeightScale: aHeightScale;
		initialize
]

{ #category : #'instance creation' }
BrGlamorousButtonRectangularAptitude class >> paddingScale: aPaddingScale heightScale: aHeightScale cornerRadius: aCornerRadius [
	^ self basicNew
		setPaddingScale: aPaddingScale;
		setHeightScale: aHeightScale;
		setCornerRadius: aCornerRadius;
		initialize
]

{ #category : #accessing }
BrGlamorousButtonRectangularAptitude >> cornerRadius [
	^ cornerRadius
]

{ #category : #accessing }
BrGlamorousButtonRectangularAptitude >> cornerRadius: aNumber [
	cornerRadius := aNumber.
	self default geometry: (BlRoundedRectangleGeometry cornerRadius: self cornerRadius)
]

{ #category : #initialization }
BrGlamorousButtonRectangularAptitude >> initialize [
	| miniPadding tinyPadding smallPadding normalPadding largePadding hugePadding miniHeight tinyHeight smallHeight normalHeight largeHeight hugeHeight |
	super initialize.

	cornerRadius := cornerRadius ifNil: [ 4 ].
	paddingScale := paddingScale ifNil: [ 1.0 ].
	heightScale := heightScale ifNil: [ 1.0 ].
	
	miniPadding := 4 * paddingScale.
	tinyPadding := 6 * paddingScale.
	smallPadding := 6 * paddingScale.
	normalPadding := 8 * paddingScale.
	largePadding := 10 * paddingScale.
	hugePadding := 16 * paddingScale.
	
	miniHeight := 12 * heightScale.
	tinyHeight := 16 * heightScale.
	smallHeight := 20 * heightScale.
	normalHeight := 24 * heightScale.
	largeHeight := 30 * heightScale.
	hugeHeight := 48 * heightScale.

	self default geometry: (BlRoundedRectangleGeometry cornerRadius: cornerRadius).
	
	self add: (BrSizeAdjustmentAptitude new
		mini: [ :aStyle |
			aStyle
				vExact: miniHeight;
				padding: (BlInsets left: miniPadding right: miniPadding) ];
		tiny: [ :aStyle |
			aStyle
				vExact: tinyHeight;
				padding: (BlInsets left: tinyPadding right: tinyPadding) ];
		small: [ :aStyle | 
			aStyle
				vExact: smallHeight;
				padding: (BlInsets left: smallPadding right: smallPadding) ];
		normal: [ :aStyle | 
			aStyle
				vExact: normalHeight;
				padding: (BlInsets left: normalPadding right: normalPadding) ];
		large: [ :aStyle |
			aStyle
				vExact: largeHeight;
				padding: (BlInsets left: largePadding right: largePadding) ];
		huge: [ :aStyle |
			aStyle
				vExact: hugeHeight;
				padding: (BlInsets left: hugePadding right: hugePadding) ]).

	self add: BrGlamorousButtonLayoutAptitude new
]

{ #category : #initialization }
BrGlamorousButtonRectangularAptitude >> setCornerRadius: aNumber [
	cornerRadius := aNumber
]

{ #category : #initialization }
BrGlamorousButtonRectangularAptitude >> setHeightScale: aNumber [
	heightScale := aNumber
]

{ #category : #initialization }
BrGlamorousButtonRectangularAptitude >> setPaddingScale: aNumber [
	paddingScale := aNumber
]
