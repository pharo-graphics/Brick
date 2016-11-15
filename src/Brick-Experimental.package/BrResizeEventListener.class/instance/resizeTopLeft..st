resizing
resizeTopLeft: aPosition
	| lPos |
	lPos := target globalPointToLocal: aPosition.
	self root extent: (self root width - (lPos x)) @ (self root height - lPos y).
	self root windowPosition: aPosition .