as yet unclassified
onMouseLeave: anEvent
	self deactivateState: BlPressedState.
	self deactivateState: BlHoveredState.
	self onStateChanged.
	super onMouseLeave: anEvent