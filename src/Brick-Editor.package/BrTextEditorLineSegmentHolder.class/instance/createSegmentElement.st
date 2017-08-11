initialization
createSegmentElement
	<return: #BlElement>
	
	^ BlElement new
		layout: BrEditorFlowLayout new;
		focusability: BlFocusability after;
		margin: (BlInsets bottom: 5);
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ];
		yourself