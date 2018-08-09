initialization
initializeListeners
	super initializeListeners.
	self
		addEventHandlerOn: BrToolbarItemContentChanged 
		do: [ :anEvent | self onItemContentChanged: anEvent stencil ]