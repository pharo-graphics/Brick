Class {
	#name : #BrGlamorousButtonExteriorLook,
	#superclass : #BrInteractiveCommonLook,
	#instVars : [
		'backgroundPaint'
	],
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #accessing }
BrGlamorousButtonExteriorLook >> backgroundPaint [
	^ backgroundPaint
]

{ #category : #accessing }
BrGlamorousButtonExteriorLook >> backgroundPaint: aPaint [
	backgroundPaint := aPaint
]

{ #category : #initialization }
BrGlamorousButtonExteriorLook >> initialize [
	super initialize.
	
	backgroundPaint := Color white.

	self
		addChangeProperty: #(widgetContent background)
		with: [ self backgroundPaint ].

	self
		addChangeProperty: #(widget border)
		with: (BlBorder paint: BrGlamorousColors defaultButtonBorderColor width: 1).
	
	self
		style: [ :aStyler | 
			aStyler
				default: [ :aWidget | 
					aWidget
						background: BrGlamorousColors defaultButtonBackgroundColor;
						border: (BlBorder paint: BrGlamorousColors defaultButtonBorderColor width: 1) ].
			aStyler
				hovered: [ :aWidget | 
					aWidget
						border: (BlBorder paint: BrGlamorousColors hoveredButtonBorderColor width: 1) ].
			aStyler
				pressed: [ :aWidget | 
					aWidget
						border: (BlBorder paint: BrGlamorousColors pressedButtonBorderColor width: 1) ].
			aStyler
				disabled: [ :aWidget | 
					aWidget
						background: BrGlamorousColors disabledButtonBackgroundColor;
						border: (BlBorder paint: BrGlamorousColors disabledButtonBorderColor width: 1) ] ]
]
