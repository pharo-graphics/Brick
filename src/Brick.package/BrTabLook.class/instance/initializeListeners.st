initialization
initializeListeners
	super initializeListeners.
	
	self when: BrTabSelectedEvent do: [ self tabSelected ].
	self when: BrTabDeselectedEvent do: [ self tabDeselected ].
	self when: BrTabEnabledEvent do: [ self tabEnabled ].
	self when: BrTabDisabledEvent do: [ self tabDisabled ]