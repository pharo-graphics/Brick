as yet unclassified
updateCursorFromEvent: anEvent
	|lPos  |
	lPos := target globalPointToLocal: anEvent position.
	isTop := (lPos y < 8).
	isBottom := (lPos y >  (target height - 8)).
	isLeft := (lPos x < 8).
	isRight := (lPos x >  (target width - 8)).
	
	isTop ifTrue:[
			isLeft ifTrue:[^ target mouseCursor: BlCursor resizeTopLeft ].
			isRight ifTrue:[^ target mouseCursor: BlCursor resizeTopRight ].
			^ target mouseCursor: BlCursor resizeTop 
		].
	isBottom ifTrue:[
			isLeft ifTrue:[^ target mouseCursor: BlCursor resizeBottomLeft ].
			isRight ifTrue:[^ target mouseCursor: BlCursor resizeBottomRight ].
			^ target mouseCursor: BlCursor resizeBottom 
		].
	isLeft ifTrue:[^ target mouseCursor: BlCursor resizeLeft].
	isRight ifTrue:[^ target mouseCursor: BlCursor resizeRight]