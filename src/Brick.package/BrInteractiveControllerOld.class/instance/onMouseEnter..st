as yet unclassified
onMouseEnter: anEvent
	self activateState: BlHoveredState.
	self onStateChanged.
	super onMouseEnter: anEvent