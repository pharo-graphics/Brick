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
	changes
		add:
			(BrLookPropertyChange new
				path: #(widget height);
				value: 24;
				yourself);
		add:
			(BrLookPropertyChange new
				path: #(widget padding);
				value: (BlInsets left: 10 right: 10);
				yourself);
		add:
			(BrLookPropertyChange new
				path: #(widgetContent constraints horizontal resizer);
				value: BlLayoutFitContentResizer uniqueInstance;
				yourself);
		add:
			(BrLookPropertyChange new
				path: #(widgetContent layout);
				value: BlLinearLayout horizontal alignCenter;
				yourself);
		add:
			(BrLookPropertyChange new
				path: #(widgetContent background);
				value: self backgroundPaint asBlBackground;
				yourself);
		add:
			(BrLookPropertyChange new
				path: #(widgetContent geometry);
				value: (BlRectangle cornerRadius: 4);
				yourself).
	self
		style: [ :aStyler | 
			aStyler
				default: [ :aWidget | 
					aWidget
						height: 24;
						padding: (BlInsets left: 10 right: 10) ].
			aStyler huge: [ :aWidget | aWidget height: 48 ].
			aStyler large: [ :aWidget | aWidget height: 30 ].
			aStyler
				small: [ :aWidget | 
					aWidget
						height: 20;
						padding: (BlInsets left: 8 right: 8) ].
			aStyler
				tiny: [ :aWidget | 
					aWidget
						height: 16;
						padding: (BlInsets left: 6 right: 6) ] ]
]
