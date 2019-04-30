Class {
	#name : #GtDropdownOutskirtsLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Dropdown'
}

{ #category : #'as yet unclassified' }
GtDropdownOutskirtsLook >> initialize [
	super initialize.
	changes
		add:
			(#(widget geometry)
				asBrLookPropertyChangeWithValue: [ BlRectangle cornerRadius: 12 ]).
	changes
		add:
			(#(widget background) asBrLookPropertyChangeWithValue: [ Color white ]).
	changes
		add:
			(#(widget border)
				asBrLookPropertyChangeWithValue:
					[ BlBorder paint: BrGlamorousColors defaultButtonBorderColor width: 1 ])
]
