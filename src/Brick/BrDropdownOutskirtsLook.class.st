Class {
	#name : #BrDropdownOutskirtsLook,
	#superclass : #BrLook,
	#category : #'Brick-Dropdown - Look'
}

{ #category : #'as yet unclassified' }
BrDropdownOutskirtsLook >> initialize [
	super initialize.
	changes
		add:
			(#(widget background) asBrLookPropertyChangeWithValue: [ Color white ]).
	changes
		add:
			(#(widget border)
				asBrLookPropertyChangeWithValue: [ BlBorder paint: Color gray width: 1 ])
]
