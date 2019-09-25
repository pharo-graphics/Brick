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
	self addChangeProperty: #(widget height) with: 24.
	self
		addChangeProperty: #(widget padding)
		with: (BlInsets left: 10 right: 10).

	self
		addChangeProperty: #(widgetContent geometry)
		with: (BlRectangle cornerRadius: 4).

	self add: BrLayoutResizerLook inherit.
	self add: BrLayoutAlignmentLook forHorizontalLinearLayout.
	
	self add: (BrInteractiveSizeLook new
		default: [ :aWidget | 
			aWidget
				height: 24;
				padding: (BlInsets left: 10 right: 10) ];
		tiny: [ :aWidget | 
			aWidget
				height: 16;
				padding: (BlInsets left: 6 right: 6) ];
		small: [ :aWidget | 
			aWidget
				height: 20;
				padding: (BlInsets left: 8 right: 8) ];
		huge: [ :aWidget | aWidget height: 48 ];
		large: [ :aWidget | aWidget height: 30 ])
]
