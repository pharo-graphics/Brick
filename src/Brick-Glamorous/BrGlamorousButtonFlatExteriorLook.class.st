Class {
	#name : #BrGlamorousButtonFlatExteriorLook,
	#superclass : #BrStyleCommonLook,
	#instVars : [
		'backgroundPaint'
	],
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #accessing }
BrGlamorousButtonFlatExteriorLook >> backgroundPaint [
	^ backgroundPaint
]

{ #category : #accessing }
BrGlamorousButtonFlatExteriorLook >> backgroundPaint: aPaint [
	backgroundPaint := aPaint
]

{ #category : #accessing }
BrGlamorousButtonFlatExteriorLook >> disabledBackgroundPaint [
	^ BrGlamorousColors disabledButtonBackgroundColor
]

{ #category : #accessing }
BrGlamorousButtonFlatExteriorLook >> hoveredBackgroundPaint [
	^ Color gray alpha: 0.15
]

{ #category : #initialization }
BrGlamorousButtonFlatExteriorLook >> initialize [
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
BrGlamorousButtonFlatExteriorLook >> pressedBackgroundPaint [
	^ Color gray alpha: 0.3
]
