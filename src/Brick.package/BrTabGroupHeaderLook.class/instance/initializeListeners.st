initialization
initializeListeners
	super initializeListeners.

	self when: BrTabAddedEvent do: [ :anEvent | self onTabAdded: anEvent tab ].
	self when: BrTabRemovedEvent do: [ :anEvent | self onTabRemoved: anEvent tab ].
	self when: BrTabsChangedEvent do: [ :anEvent | self onTabsChanged: anEvent tabs ]