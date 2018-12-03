Class {
	#name : #BrDropdownOutskirtsLook,
	#superclass : #BrLook,
	#category : #'Brick-Dropdown - Look'
}

{ #category : #initialization }
BrDropdownOutskirtsLook >> initializeLook [
	super initializeLook.

	self widget
		background: Color white;
		border: (BlBorder paint: Color gray width: 1)
]
