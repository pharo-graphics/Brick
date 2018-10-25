"
I define the rectangular exterior of the button
"
Class {
	#name : #BrGlamorousButtonExteriorRectangularLook,
	#superclass : #BrGlamorousButtonExteriorLook,
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #initialization }
BrGlamorousButtonExteriorRectangularLook >> initialize [
	super initialize.
	
	self style: [ :aStyler |
		aStyler default: [ :aWidget | aWidget height: 24 ].
		aStyler large: [ :aWidget | aWidget height: 30 ].
		aStyler small: [ :aWidget | aWidget height: 20 ].
		aStyler tiny: [ :aWidget | aWidget height: 16 ] ]
]

{ #category : #initialization }
BrGlamorousButtonExteriorRectangularLook >> initializeLook [
	super initializeLook.

	self widgetContent
		padding: (BlInsets top: 0 right: 10 bottom: 0 left: 10);
		constraintsDo: [ :c | c horizontal fitContent ];
		layout: BlLinearLayout horizontal alignCenter;
		background: self backgroundPaint;
		geometry: (BlRectangle cornerRadius: 4)
]
