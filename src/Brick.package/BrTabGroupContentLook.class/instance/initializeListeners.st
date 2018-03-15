initialization
initializeListeners
	super initializeListeners.

	self when: BrTabSelectedEvent do: [ :anEvent | self onTabSelected: anEvent tab ].
	self when: BrTabDeselectedEvent do: [ :anEvent | self onTabDeselected: anEvent tab ]