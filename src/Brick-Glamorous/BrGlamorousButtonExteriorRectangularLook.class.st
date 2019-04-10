"
I define the rectangular exterior of the button
"
Class {
	#name : #BrGlamorousButtonExteriorRectangularLook,
	#superclass : #BrGlamorousButtonExteriorLook,
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #initialization }
BrGlamorousButtonExteriorRectangularLook >> finalizeLook [
	super finalizeLook.
	self widgetContent constraints horizontal
		resizer: (stateCache at: #contentResizer).
	self widgetContent
		layout: (stateCache at: #contentLayout);
		background: (stateCache at: #contentBackground);
		geometry: (stateCache at: #contentGeometry).
	self widget
		width: (stateCache at: #width);
		height: (stateCache at: #height);
		padding: (stateCache at: #padding)
]

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
	stateCache
		at: #contentResizer put: self widgetContent constraints horizontal resizer;
		at: #contentLayout put: self widgetContent layout;
		at: #contentBackground put: self widgetContent background;
		at: #contentGeometry put: self widgetContent geometry;
		at: #width put: self widget width;
		at: #height put: self widget height;
		at: #padding put: self widget padding.
	self widgetContent
		constraintsDo: [ :c | c horizontal fitContent ];
		layout: BlLinearLayout horizontal alignCenter;
		background: self backgroundPaint;
		geometry: (BlRectangle cornerRadius: 4)
]
