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
		aStyler default: [ :aWidget | aWidget
			height: 24;
			padding: (BlInsets left: 10 right: 10) ].
		aStyler huge: [ :aWidget | aWidget height: 48 ].
		aStyler large: [ :aWidget | aWidget height: 30 ].
		aStyler small: [ :aWidget | aWidget
			height: 20;
			padding: (BlInsets left: 8 right: 8) ].
		aStyler tiny: [ :aWidget | aWidget
			height: 16;
			padding: (BlInsets left: 6 right: 6) ] ]
]

{ #category : #initialization }
BrGlamorousButtonExteriorRectangularLook >> initializeLook [
	super initializeLook.

	self widgetContent
		constraintsDo: [ :c | c horizontal fitContent ];
		layout: BlLinearLayout horizontal alignCenter;
		background: self backgroundPaint;
		geometry: (BlRectangle cornerRadius: 4)
]
