as yet unclassified
onMouseUp: anEvent
	self toggleState: BlCheckedState.
	widget checked: self isChecked.
	widget indeterminate: false.
	self onStateChanged.
	^ super onMouseUp: anEvent