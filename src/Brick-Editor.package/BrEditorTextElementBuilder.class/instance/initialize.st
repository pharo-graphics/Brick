initialization
initialize
	super initialize.
	
	initializeElementBlock := [ BrTextEditorPieceElement new ].
	bindBlock := [ :anElement :aDisplayedValue | anElement text: aDisplayedValue ]