dnd handlers
dragStartEvent: anEvent
	super dragStartEvent: anEvent.
	
	anEvent currentTarget children first editor prepareSelection