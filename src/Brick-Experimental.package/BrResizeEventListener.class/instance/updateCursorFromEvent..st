as yet unclassified
updateCursorFromEvent: anEvent
	|lPos  |
	lPos := target globalPointToLocal: anEvent position.
	isTop := (lPos y < 8).
	isBottom := (lPos y >  (target height - 8)).
	isLeft := (lPos x < 8).
	isRight := (lPos x >  (target width - 8)).
	
	isTop ifTrue:[
			isLeft ifTrue:[^ target cursor: BlCursor resizeTopLeft ].
			isRight ifTrue:[^ target cursor: BlCursor resizeTopRight ].
			^ target cursor: BlCursor resizeTop 
		].
	isBottom ifTrue:[
			isLeft ifTrue:[^ target cursor: BlCursor resizeBottomLeft ].
			isRight ifTrue:[^ target cursor: BlCursor resizeBottomRight ].
			^ target cursor: BlCursor resizeBottom 
		].
	isLeft ifTrue:[^ target cursor: BlCursor resizeLeft].
	isRight ifTrue:[^ target cursor: BlCursor resizeRight]