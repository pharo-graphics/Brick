hooks
onAttachedTo: anElement
	super onAttachedTo: anElement.

	self when: BrLabelRequest reply: [ BrLabelChanged new text: self label ].
	self when: BrIconRequest reply: [ BrIconChanged new icon: self icon ]