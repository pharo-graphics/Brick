initialization
initialize
	super initialize.
	
	initializeElementBlock := [ BlTextEditElement new ].
	bindBlock := [ :anElement :aDisplayedValue | anElement text: aDisplayedValue ]