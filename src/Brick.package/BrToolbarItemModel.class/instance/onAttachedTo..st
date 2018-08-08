hooks
onAttachedTo: anElement
	super onAttachedTo: anElement.
	self 
		when: BrToolbarItemContentRequest 
		reply: [ BrToolbarItemContentChanged new stencil: self stencil ].