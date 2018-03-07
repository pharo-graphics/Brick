initialization
initializeState
	super initializeState.
	
	widget isActivated
		ifTrue: [ self toggleActivated ]
		ifFalse: [ self toggleDeactivated ]