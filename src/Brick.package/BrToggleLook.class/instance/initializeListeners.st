initialization
initializeListeners
	super initializeListeners.
	
	self when: BrToggleActivatedEvent do: [ self toggleActivated ].
	self when: BrToggleDeactivatedEvent do: [ self toggleDeactivated ]