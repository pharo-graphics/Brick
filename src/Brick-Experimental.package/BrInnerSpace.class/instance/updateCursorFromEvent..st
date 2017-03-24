as yet unclassified
updateCursorFromEvent: anEvent
	|lPos isTop isBottom isLeft isRight |
	lPos := self globalPointToLocal: anEvent position.
	isTop := (lPos y < 8).
	isBottom := (lPos y >  (self height - 8)).
	isLeft := (lPos x < 8).
	isRight := (lPos x >  (self width - 8)).
	
	isTop ifTrue:[
			isLeft ifTrue:[^ self mouseCursor: BlCursor resizeTopLeft ].
			isRight ifTrue:[^ self mouseCursor: BlCursor resizeTopRight ].
			^ self mouseCursor: BlCursor resizeTop 
		].
	isBottom ifTrue:[
			isLeft ifTrue:[^ self mouseCursor: BlCursor resizeBottomLeft ].
			isRight ifTrue:[^ self mouseCursor: BlCursor resizeBottomRight ].
			^ self mouseCursor: BlCursor resizeBottom 
		].
	isLeft ifTrue:[^ self mouseCursor: BlCursor resizeLeft].
	isRight ifTrue:[^ self mouseCursor: BlCursor resizeRight]