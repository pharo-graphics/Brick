mouse handlers
mouseLeaveEvent: anEvent
	self performLeaveAction: anEvent.
	anEvent currentTarget 
		invalidate;
		requestLayout