initialization
createSegmentElement
	<return: #BlElement>
	
	^ BlElement new
		layout: BrEditorFlowLayout new;
		focusability: BlFocusability after;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ];
		yourself