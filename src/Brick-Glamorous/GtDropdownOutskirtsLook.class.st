Class {
	#name : #GtDropdownOutskirtsLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Dropdown'
}

{ #category : #initialization }
GtDropdownOutskirtsLook >> initializeLook [
	super initializeLook.

	self widget
		geometry: (BlRectangle cornerRadius: 12);
		background: Color white;
		border: (BlBorder paint: BrGlamorousColors defaultButtonBorderColor width: 1)
]
