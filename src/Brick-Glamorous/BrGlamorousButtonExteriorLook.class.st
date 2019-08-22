Class {
	#name : #BrGlamorousButtonExteriorLook,
	#superclass : #BrInteractiveCommonLook,
	#instVars : [
		'backgroundPaint',
		'borderWidth',
		'borderPaint'
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

{ #category : #accessing }
BrGlamorousButtonExteriorLook >> borderWidth [
	^ borderWidth
]

{ #category : #accessing }
BrGlamorousButtonExteriorLook >> borderWidth: anInteger [
	borderWidth := anInteger
]

{ #category : #initialization }
BrGlamorousButtonExteriorLook >> initialize [
	super initialize.
	
	backgroundPaint := BrGlamorousColors defaultButtonBackgroundColor.
	borderPaint := BrGlamorousColors defaultButtonBorderColor.
	borderWidth := 1.

	self
		addChangeProperty: #(widgetContent background)
		with: [ self backgroundPaint ].

	self
		addChangeProperty: #(widget border)
		with: (BlBorder paint: borderPaint width: self borderWidth).
	
	self
		style: [ :aStyler | 
			aStyler
				default: [ :aWidget | 
					aWidget
						background: backgroundPaint;
						border: (BlBorder paint: borderPaint width: self borderWidth) ].
			aStyler
				hovered: [ :aWidget | 
					aWidget
						border: (BlBorder paint: BrGlamorousColors hoveredButtonBorderColor width: self borderWidth) ].
			aStyler
				pressed: [ :aWidget | 
					aWidget
						border: (BlBorder paint: BrGlamorousColors pressedButtonBorderColor width: self borderWidth) ].
			aStyler
				disabled: [ :aWidget | 
					aWidget
						background: BrGlamorousColors disabledButtonBackgroundColor;
						border: (BlBorder paint: BrGlamorousColors disabledButtonBorderColor width: self borderWidth) ] ].
]
