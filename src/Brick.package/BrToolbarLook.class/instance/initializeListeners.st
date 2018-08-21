initialization
initializeListeners
	super initializeListeners.

	self when: BrToolbarItemAddedEvent do: [ :anEvent | self onItemAdded: anEvent item ].
	self when: BrToolbarItemRemovedEvent do: [ :anEvent | self onItemRemoved: anEvent item ]