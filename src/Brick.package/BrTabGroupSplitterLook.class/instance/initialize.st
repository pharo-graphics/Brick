initialization
initialize
	super initialize.
	
	splitter := BlElement new.
	splitter background: Color veryVeryLightGray.
	splitter constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical exact: 1 ]