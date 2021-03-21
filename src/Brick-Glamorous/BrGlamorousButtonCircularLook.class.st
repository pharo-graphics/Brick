"
I define the circular exterior of the button. I am designed to be used with an icon look
"
Class {
	#name : #BrGlamorousButtonCircularLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #initialization }
BrGlamorousButtonCircularLook >> initialize [
	super initialize.
	self
		addChangeProperty: #(widgetContent layout)
		with: [ BlLinearLayout horizontal alignCenter ].

	self
		addChangeProperty: #(widgetContent geometry)
		with: [ BlCircle new ].

	self add: (BrSizeAdjustmentLook new
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
				padding: (BlInsets left: 16 right: 16) ])
]
