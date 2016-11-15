initialization
initialize
	super initialize.
	self styleClass: #viewport.
	self constraintsDo: [:c| 
		c horizontal matchParent.
		c vertical matchParent ].