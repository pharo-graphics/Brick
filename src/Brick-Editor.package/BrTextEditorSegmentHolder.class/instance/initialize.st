initialization
initialize
	super initialize.
	
	itemElement := BrEditorSegmentElement new
		layout: BrEditorFlowLayout new;
		focusability: BlFocusability after;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ];
		yourself