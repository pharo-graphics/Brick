initialization
createSegmentElement
	<return: #BlElement>
	
	^ BrTextEditorSegmentElement new
		layout: BrEditorFlowLayout new;
		focusability: BlFocusability after;
		margin: (BlInsets bottom: 5);
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ];
		yourself