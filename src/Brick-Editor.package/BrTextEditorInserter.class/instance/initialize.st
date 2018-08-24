initialization
initialize
	super initialize.
	
	insertionIndices := SortedCollection new.
	shouldUpdateCursor := true.
	shouldUpdateSelection := true.
	shouldDeleteSelected := true