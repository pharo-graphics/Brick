Class {
	#name : #BrGlamorousToggleGroupLook,
	#superclass : #BrToggleGroupLook,
	#category : #'Brick-Glamorous-Toggle'
}

{ #category : #initialization }
BrGlamorousToggleGroupLook >> initialize [
	super initialize.
	
	self addChangeProperty: #(widget layout) with: [ BlLinearLayout horizontal cellSpacing: 0 ].
	self
		addChangeProperty: #(widget geometry)
		with: [ BlRoundedRectangleGeometry cornerRadius: 3 ].
	self
		addChangeProperty: #(widget border)
		with: [ BlBorder paint: BrGlamorousColors defaultButtonBorderColor width: 1 ].

	self add: (BrLayoutResizerLook inherit)
]
