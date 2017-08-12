initialization
createSegmentElement
	<return: #BlElement>
	
	^ BrTextEditorSegmentElement new
		layout: BrEditorFlowLayout new;
		focusability: BlFocusability after;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ];
		yourself