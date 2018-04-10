initialization
initializeListeners
	super initializeListeners.
	
	self when: BrListItemsChangedEvent do: [ :anEvent | self onItemsChanged: anEvent items ].
	self when: BrListColumnsChangedEvent do: [ :anEvent | self onColumnsChanged: anEvent columns ]