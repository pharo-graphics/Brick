Class {
	#name : #BrGlamorousButtonFlatExteriorAptitude,
	#superclass : #BrStyleCommonAptitude,
	#instVars : [
		'backgroundPaint'
	],
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #accessing }
BrGlamorousButtonFlatExteriorAptitude >> backgroundPaint [
	^ backgroundPaint
]

{ #category : #accessing }
BrGlamorousButtonFlatExteriorAptitude >> backgroundPaint: aPaint [
	backgroundPaint := aPaint
]

{ #category : #accessing }
BrGlamorousButtonFlatExteriorAptitude >> disabledBackgroundPaint [
	^ BrGlamorousColors disabledButtonBackgroundColor
]

{ #category : #accessing }
BrGlamorousButtonFlatExteriorAptitude >> hoveredBackgroundPaint [
	^ Color gray alpha: 0.15
]

{ #category : #initialization }
BrGlamorousButtonFlatExteriorAptitude >> initialize [
	super initialize.
	
	backgroundPaint := Color transparent.

	self
		default: [ :aStyle | aStyle
			background: backgroundPaint;
			border: BlBorder empty  ];
		focused: [ :aStyle | aStyle border: (BlBorder paint: BrGlamorousColors hoveredButtonBorderColor width: 1) ];
		hovered: [ :aStyle | aStyle background: self hoveredBackgroundPaint ];
		pressed: [ :aStyle | aStyle background: self pressedBackgroundPaint ];
		disabled: [ :aStyle | aStyle background: self disabledBackgroundPaint ]
]

{ #category : #accessing }
BrGlamorousButtonFlatExteriorAptitude >> pressedBackgroundPaint [
	^ Color gray alpha: 0.3
]
