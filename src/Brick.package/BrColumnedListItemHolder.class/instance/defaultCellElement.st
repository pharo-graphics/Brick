instance creation
defaultCellElement
	^ BlElement new
		background: Color random;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical exact: 40 ]