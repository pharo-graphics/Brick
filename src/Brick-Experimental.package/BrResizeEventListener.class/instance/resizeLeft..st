resizing
resizeLeft: aPosition
	| lPos |
	lPos := target globalPointToLocal: aPosition.
	self root extent: (self root width - (lPos x)) @ self root height.
	self root windowPosition: aPosition x @ self root windowPosition y.
	