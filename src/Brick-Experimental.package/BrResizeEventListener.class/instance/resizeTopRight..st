resizing
resizeTopRight: aPosition
	| lPos |
	lPos := target globalPointToLocal: aPosition.
	self root extent: lPos x @ (self root height - lPos y).
	self root windowPosition: self root windowPosition x@ aPosition y.
	