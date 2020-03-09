"
I define the rectangular exterior of the button
"
Class {
	#name : #BrGlamorousButtonRectangularLook,
	#superclass : #BrInteractiveCommonLook,
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #initialization }
BrGlamorousButtonRectangularLook >> initialize [
	super initialize.

	self
		addChangeProperty: #(widgetContent geometry)
		with: (BlRectangle cornerRadius: 4).
		
	self add: BrGlamorousButtonLayoutLook new.
	
	self add: (BrInteractiveSizeLook new
		default: [ :aWidget | 
			aWidget
				vExact: 24;
				padding: (BlInsets left: 10 right: 10) ];
		tiny: [ :aWidget | 
			aWidget
				vExact: 16;
				padding: (BlInsets left: 6 right: 6) ];
		small: [ :aWidget | 
			aWidget
				vExact: 20;
				padding: (BlInsets left: 8 right: 8) ];
		huge: [ :aWidget | aWidget height: 48 ];
		large: [ :aWidget | aWidget height: 30 ])
]
