dnd handlers
dragEndEvent: anEvent
	super dragEndEvent: anEvent.

	anEvent currentTarget editor commitSelection.
	anEvent currentTarget requestFocus.