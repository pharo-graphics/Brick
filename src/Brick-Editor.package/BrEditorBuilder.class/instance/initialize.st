initialization
initialize
	super initialize.
	
	displayBlock := #yourself.
	layoutBlock := [ BrEditorFlowLayout new ].
	segmentBlock := [ BrEditorSegmentElement new ].
	itemBlock := [ BlElement new ].
	bindBlock := [  ]