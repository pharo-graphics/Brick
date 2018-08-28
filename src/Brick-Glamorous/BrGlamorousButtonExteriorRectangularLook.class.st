"
I define the rectangular exterior of the button
"
Class {
	#name : #BrGlamorousButtonExteriorRectangularLook,
	#superclass : #BrGlamorousButtonExteriorLook,
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #initialization }
BrGlamorousButtonExteriorRectangularLook >> initializeLook [
	super initializeLook.

	self widgetContent
		padding: (BlInsets top: 0 right: 10 bottom: 0 left: 10);
		height: 24;
		constraintsDo: [ :c | c horizontal fitContent ];
		layout: BlLinearLayout horizontal alignCenter;
		background: Color white;
		geometry: (BlRectangle cornerRadius: 4)
]
