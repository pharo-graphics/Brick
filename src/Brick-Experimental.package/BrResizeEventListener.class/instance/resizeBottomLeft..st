resizing
resizeBottomLeft: aPosition
	| lPos |
	lPos := target globalPointToLocal: aPosition.
	 self root extent:  (self root width - (lPos x)) @ lPos y.
	self root windowPosition: aPosition x @ self root windowPosition y.
	