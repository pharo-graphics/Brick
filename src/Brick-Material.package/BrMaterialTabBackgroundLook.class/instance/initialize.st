initialization
initialize
	super initialize.

	bar := BlElement new.
	bar background: (Color fromHexString: #'2196F3').
	bar constraintsDo: [ :c |
		c ignoreByLayout.
		c ignored vertical alignBottom.
		c vertical exact: 2.
		c horizontal matchParent ]