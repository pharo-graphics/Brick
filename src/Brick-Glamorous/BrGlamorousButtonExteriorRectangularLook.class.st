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
		add: (#(widget height) asBrLookPropertyChangeWithValue: 24);
		add:
			(#(widget padding)
				asBrLookPropertyChangeWithValue: (BlInsets left: 10 right: 10));
		add:
			(#(widgetContent constraints horizontal resizer)
				asBrLookPropertyChangeWithValue: BlLayoutFitContentResizer uniqueInstance);
		add:
			(#(widgetContent layout)
				asBrLookPropertyChangeWithValue: BlLinearLayout horizontal alignCenter);
		add:
			(#(widgetContent background)
				asBrLookPropertyChangeWithValue: self backgroundPaint);
		add:
			(#(widgetContent geometry)
				asBrLookPropertyChangeWithValue: (BlRectangle cornerRadius: 4)).
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
