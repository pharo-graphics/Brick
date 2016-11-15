as yet unclassified
onMouseUp: anEvent
	self toggleState: BlCheckedState.
	widget checked: self isChecked.
	self onStateChanged.
	^ super onMouseUp: anEvent