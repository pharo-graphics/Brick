initialization
initialize
	super initialize.

	title := 'Column'.
	evaluationBlock := #displayString.
	shapeBlock := [ :anObject :aCellElement | aCellElement ]