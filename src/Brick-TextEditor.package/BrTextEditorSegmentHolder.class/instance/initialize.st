initialization
initialize
	super initialize.
	
	itemElement := BrTextEditorSegmentElement new
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ];
		yourself