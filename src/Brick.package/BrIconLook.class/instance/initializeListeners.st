initialization
initializeListeners
	super initializeListeners.

	self when: BrIconChanged do: [ :anEvent | self icon: anEvent icon ]