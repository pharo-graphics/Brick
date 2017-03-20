initialization
initialize
	super initialize.
	
	displayBlock := #yourself.
	segmentElementBlock := [ BrEditorSegmentElement new ].
	inlined := false