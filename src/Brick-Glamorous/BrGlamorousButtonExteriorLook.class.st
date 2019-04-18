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
BrGlamorousButtonExteriorLook >> backgroundPaint: anObject [
	backgroundPaint := anObject
]

{ #category : #initialization }
BrGlamorousButtonExteriorLook >> initialize [
	super initialize.
	changes
		add:
			(#(widget background)
				asBrLookPropertyChangeWithValue: BrGlamorousColors defaultButtonBackgroundColor asBlBackground);
		add:
			(#(widget border)
				asBrLookPropertyChangeWithValue: (BlBorder paint: BrGlamorousColors defaultButtonBorderColor width: 1)).
	backgroundPaint := Color white.
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
