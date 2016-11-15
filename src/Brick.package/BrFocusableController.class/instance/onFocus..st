as yet unclassified
onFocus: anEvent
	self activateState: BlFocusedState.
	self onStateChanged.
	^ super onFocus: anEvent