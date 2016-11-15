as yet unclassified
updateChildren
	super updateChildren.
	track addChild: thumb.
	widget addChild: track.
	self showButtons: widget withButtons.
	self orientation for: thumb length: self thumbLength.
	self orientation for: track breadth: (self breadthOf: thumb).