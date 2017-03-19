initialization
initialize
	super initialize.
	
	itemElement := BrEditorSegmentElement new
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ];
		yourself