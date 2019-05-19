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
	self
		addChangeProperty: #(widgetContent layout)
		with: [ BlLinearLayout horizontal alignCenter ].
	self
		addChangeProperty: #(widgetContent background)
		with: [ self backgroundPaint ].
	self
		addChangeProperty: #(widgetContent geometry)
		with: [ BlCircle new ]
]
