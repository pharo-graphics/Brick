hooks
onAttachedTo: anElement
	super onAttachedTo: anElement.

	self when: BrIconRequest reply: [ BrIconChanged new icon: self icon ]