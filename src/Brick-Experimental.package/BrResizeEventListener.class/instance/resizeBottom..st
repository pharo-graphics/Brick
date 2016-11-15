resizing
resizeBottom: aPosition
	| lPos |
	lPos := target globalPointToLocal: aPosition.
	 self root extent:  self root width @ lPos y