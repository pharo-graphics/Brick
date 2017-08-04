dnd handlers
dragStartEvent: anEvent
	super dragStartEvent: anEvent.
	
	anEvent currentTarget editor prepareSelection