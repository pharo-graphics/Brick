as yet unclassified
onMouseUp: anEvent
	self activateState: BlSelectedState.
	 widget selected: self isSelected.
	self onStateChanged.
	^ super onMouseUp: anEvent