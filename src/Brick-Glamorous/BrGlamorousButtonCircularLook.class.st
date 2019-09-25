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
		
	self default: [ self widgetContent size: 24 @ 24 ]
]
