hooks
onAttachedTo: anElement
	super onAttachedTo: anElement.

	self when: BrSelectionRequest reply: [ BrSelectionChanged new selection: self selection ]