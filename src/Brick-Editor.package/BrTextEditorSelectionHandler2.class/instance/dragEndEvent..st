dnd handlers
dragEndEvent: anEvent
	super dragEndEvent: anEvent.

	anEvent currentTarget children first editor commitSelection