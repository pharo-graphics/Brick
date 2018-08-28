Class {
	#name : #BrGlamorousButtonExteriorLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousButtonExteriorLook >> initialize [
	super initialize.

	self add: (BrInteractiveLook new style: [ :aStyler |
		aStyler default: [ :aWidget |
			aWidget
				background: BrGlamorousColors defaultButtonBackgroundColor;
				border: (BlBorder paint: BrGlamorousColors defaultButtonBorderColor width: 1) ].

		aStyler hovered: [ :aWidget |
			aWidget border: (BlBorder paint: BrGlamorousColors hoveredButtonBorderColor width: 1) ].

		aStyler pressed: [ :aWidget |
			aWidget border: (BlBorder paint: BrGlamorousColors pressedButtonBorderColor width: 1) ].

		aStyler disabled: [ :aWidget |
			aWidget
				background: BrGlamorousColors disabledButtonBackgroundColor;
				border: (BlBorder paint: BrGlamorousColors disabledButtonBorderColor width: 1) ] ])
]
