initialization
initialize
	super initialize.
	
	listElement := BrInfiniteListElement new.
	listElement constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical matchParent ].
	
	self rowStencilBuilder: BrSimpleListRowStencil new