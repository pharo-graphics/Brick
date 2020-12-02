"
I define the circular exterior of the button. I am designed to be used with an icon look
"
Class {
	#name : #BrGlamorousButtonCircularLook,
	#superclass : #BrInteractiveCommonLook,
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
		tiny: [ :aWidget | self widgetContent
				exact: 16;
				padding: (BlInsets left: 6 right: 6) ];
		small: [ :aWidget | self widgetContent
				exact: 20;
				padding: (BlInsets left: 8 right: 8) ];
		default: [ :aWidget | self widgetContent
				exact: 24;
				padding: (BlInsets left: 10 right: 10) ];
		large: [ :aWidget | self widgetContent
				exact: 30;
				padding: (BlInsets left: 10 right: 10) ];
		huge: [ :aWidget | self widgetContent
				exact: 48;
				padding: (BlInsets left: 16 right: 16) ])
]
