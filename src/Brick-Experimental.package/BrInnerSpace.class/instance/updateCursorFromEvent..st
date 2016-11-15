as yet unclassified
updateCursorFromEvent: anEvent
	|lPos isTop isBottom isLeft isRight |
	lPos := self globalPointToLocal: anEvent position.
	isTop := (lPos y < 8).
	isBottom := (lPos y >  (self height - 8)).
	isLeft := (lPos x < 8).
	isRight := (lPos x >  (self width - 8)).
	
	isTop ifTrue:[
			isLeft ifTrue:[^ self cursor: BlCursor resizeTopLeft ].
			isRight ifTrue:[^ self cursor: BlCursor resizeTopRight ].
			^ self cursor: BlCursor resizeTop 
		].
	isBottom ifTrue:[
			isLeft ifTrue:[^ self cursor: BlCursor resizeBottomLeft ].
			isRight ifTrue:[^ self cursor: BlCursor resizeBottomRight ].
			^ self cursor: BlCursor resizeBottom 
		].
	isLeft ifTrue:[^ self cursor: BlCursor resizeLeft].
	isRight ifTrue:[^ self cursor: BlCursor resizeRight]