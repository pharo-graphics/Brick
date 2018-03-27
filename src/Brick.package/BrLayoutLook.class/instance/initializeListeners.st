initialization
initializeListeners
	super initializeListeners.
	
	self targetElement when: BlElementAddedToParentEvent do: [ self onAddedToParent ]