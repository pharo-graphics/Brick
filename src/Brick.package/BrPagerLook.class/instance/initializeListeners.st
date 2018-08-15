initialization
initializeListeners
	super initializeListeners.

	self when: BrPagerPagesChanged do: [ :anEvent | self onPagesChanged: anEvent pages ]