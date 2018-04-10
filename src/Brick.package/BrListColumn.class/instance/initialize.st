initialization
initialize
	super initialize.
	
	title := 'Column'.
	evaluationBlock := #printString.
	shapeBlock := [ :anObject :aCellElement | aCellElement ]