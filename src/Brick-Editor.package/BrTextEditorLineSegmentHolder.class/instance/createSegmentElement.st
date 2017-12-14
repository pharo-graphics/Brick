initialization
createSegmentElement
	<return: #BlElement>

	^ BrTextEditorSegmentElement new
		layout: self class defaultSegmentLayout;
		focusability: BlFocusability after;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ];
		yourself