Class {
	#name : #BrGlamorousButtonFlatExteriorLook,
	#superclass : #BrInteractiveCommonLook,
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
		addChangeProperty: #(widgetContent background)
		with: [ self backgroundPaint ].

	self
		default: [ :aWidget | aWidget
			background: backgroundPaint;
			border: BlBorder empty  ];
		focused: [ :aWidget | aWidget border: (BlBorder paint: BrGlamorousColors hoveredButtonBorderColor width: 1) ];
		hovered: [ :aWidget | aWidget background: self hoveredBackgroundPaint ];
		pressed: [ :aWidget | aWidget background: self pressedBackgroundPaint ];
		disabled: [ :aWidget | aWidget background: self disabledBackgroundPaint ]
]

{ #category : #accessing }
BrGlamorousButtonFlatExteriorLook >> pressedBackgroundPaint [
	^ Color gray alpha: 0.3
]
