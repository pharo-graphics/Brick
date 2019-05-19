Class {
	#name : #BrDropdownOutskirtsLook,
	#superclass : #BrLook,
	#category : #'Brick-Dropdown - Look'
}

{ #category : #accessing }
BrDropdownOutskirtsLook >> initialize [
	super initialize.
	self addChangeProperty: #(widget background) with: [ Color white ].
	self
		addChangeProperty: #(widget border)
		with: [ BlBorder paint: Color gray width: 1 ]
]
