initialization
initialize
	super initialize.
	
	listElement := BrInfiniteListElement new.
	listElement dataSource: BrColumnedListDataSource new.
	listElement constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical matchParent ].
	
	self rowStencil: BrColumnedListRowStencil new