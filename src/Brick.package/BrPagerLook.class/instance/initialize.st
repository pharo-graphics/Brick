initialization
initialize
	super initialize.

	pages := OrderedDictionary new.
	pagesListElement := BrInfinitePagerElement new.
	pagesListElement constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical matchParent ]