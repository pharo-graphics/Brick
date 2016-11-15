resizing
resizeBottomRight: aPosition
	| lPos |
	lPos := target globalPointToLocal: aPosition.
	self root extent: lPos 