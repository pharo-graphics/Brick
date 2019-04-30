"
I define the circular exterior of the button. I am designed to be used with an icon look
"
Class {
	#name : #BrGlamorousButtonExteriorCircularLook,
	#superclass : #BrGlamorousButtonExteriorLook,
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #initialization }
BrGlamorousButtonExteriorCircularLook >> initialize [
	super initialize.
	self
		style: [ :aStyler | aStyler default: [ self widgetContent size: 24 @ 24 ] ].
	changes
		add:
			(#(widgetContent layout)
				asBrLookPropertyChangeWithValue: [ BlLinearLayout horizontal alignCenter ]).
	changes
		add:
			(#(widgetContent background)
				asBrLookPropertyChangeWithValue: [ self backgroundPaint ]).
	changes
		add:
			(#(widgetContent geometry)
				asBrLookPropertyChangeWithValue: [ BlCircle new ])
]
