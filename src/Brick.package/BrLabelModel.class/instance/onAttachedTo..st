hooks
onAttachedTo: anElement
	super onAttachedTo: anElement.

	self when: BrLabelRequest reply: [ BrLabelChanged new text: self text ]