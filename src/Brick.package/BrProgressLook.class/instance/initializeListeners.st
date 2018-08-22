initialization
initializeListeners
	super initializeListeners.
	
	self 
		addEventHandlerOn: BrProgressChangedEvent 
		do: [ :anEvent | self amount: anEvent amount total: anEvent total ].