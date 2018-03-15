initialization
initialize
	super initialize.

	bar := BlElement new.
	bar background: Color blue.
	bar constraintsDo: [ :c |
		c ignoreByLayout.
		c ignored vertical alignBottom.
		c vertical exact: 2.
		c horizontal matchParent ]