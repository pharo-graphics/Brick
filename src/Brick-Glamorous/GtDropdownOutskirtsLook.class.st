Class {
	#name : #GtDropdownOutskirtsLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Dropdown'
}

{ #category : #accessing }
GtDropdownOutskirtsLook >> initialize [
	super initialize.
	self
		addChangeProperty: #(widget geometry)
		with: [ BlRectangle cornerRadius: 12 ].
	self addChangeProperty: #(widget background) with: [ Color white ].
	self
		addChangeProperty: #(widget border)
		with:
			[ BlBorder paint: BrGlamorousColors defaultButtonBorderColor width: 1 ]
]
