dnd handlers
dragEndEvent: anEvent
	super dragEndEvent: anEvent.
	
	origin := nil.
	corner := nil.
	self scrollingElement unpostOnAnimation: self scrollingAction