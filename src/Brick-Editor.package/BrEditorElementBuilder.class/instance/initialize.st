initialization
initialize
	super initialize.
	
	displayBlock := #yourself.
	initializeElementBlock := [ BlElement new ].
	bindBlock := [  ].
	styledBlock := [  ]