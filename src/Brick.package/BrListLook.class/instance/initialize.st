initialization
initialize
	super initialize.
	
	listElement := BrListElement new.
	listElement constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical matchParent ].
	
	shapeBlock := [ BlElement new ]