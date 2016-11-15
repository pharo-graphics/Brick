resizing
resizeRight: aPosition
	| lPos |
	lPos := target globalPointToLocal: aPosition.
	self root extent: lPos x @ self root height