initialization
initialize
	super initialize.
	
	displayBlock := #yourself.
	segmentElementBlock := [ BrEditorSegmentElement new ].
	itemElementBlock := [ BlElement new ].
	bindBlock := [  ].
	inlined := false