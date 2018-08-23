initialization
initialize
	super initialize.
	
	deletionIntervals := BlCompositeSelection new.
	shouldUpdateCursor := true.
	shouldUpdateSelection := true