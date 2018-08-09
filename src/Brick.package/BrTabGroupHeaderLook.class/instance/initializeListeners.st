initialization
initializeListeners
	super initializeListeners.

	self when: BrTabAddedEvent do: [ :anEvent | self onTabAdded: anEvent tab ].
	self when: BrTabRemovedEvent do: [ :anEvent | self onTabRemoved: anEvent tab ].
	self when: BrTabsChangedEvent do: [ :anEvent | self onTabsChanged: anEvent tabs ].
	self when: BrTabSelectedEvent do: [ :anEvent | self onTabSelected: anEvent tab ].
	self when: BrTabDeselectedEvent do: [ :anEvent | self onTabDeselected: anEvent tab ]
	