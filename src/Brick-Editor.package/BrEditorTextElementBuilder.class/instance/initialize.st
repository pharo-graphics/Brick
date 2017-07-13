initialization
initialize
	super initialize.
	
	initializeElementBlock := [ BrEditorTextPieceElement new ].
	bindBlock := [ :anElement :aDisplayedValue | anElement text: aDisplayedValue ]