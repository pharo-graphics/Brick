"
I define the circular exterior of the button. I am designed to be used with an icon look
"
Class {
	#name : #BrGlamorousButtonExteriorCircularLook,
	#superclass : #BrGlamorousButtonExteriorLook,
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #initialization }
BrGlamorousButtonExteriorCircularLook >> initializeLook [
	super initializeLook.
	
	self widgetContent
		size: 24@24;
		layout: BlLinearLayout horizontal alignCenter;
		background: Color white;
		geometry: BlCircle new
]
