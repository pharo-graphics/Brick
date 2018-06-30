mouse handlers
mouseEnterEvent: anEvent
	self performAction: anEvent.
	anEvent currentTarget
		invalidate;
		requestLayout