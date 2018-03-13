initialization
initializeListeners
	super initializeListeners.
	
	self when: BrLabelChanged do: [ :anEvent | self text: anEvent text ]