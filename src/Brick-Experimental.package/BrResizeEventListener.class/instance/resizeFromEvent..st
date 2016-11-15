resizing
resizeFromEvent: anEvent
	| pos |
	pos := anEvent position.
	 
	isTop ifTrue:[
			isLeft ifTrue:[^ self resizeTopLeft: pos].
			isRight ifTrue:[^ self resizeTopRight: pos ].
			^ self resizeTop: pos
		].
	isBottom ifTrue:[
			isLeft ifTrue:[^ self resizeBottomLeft: pos].
			isRight ifTrue:[^ self resizeBottomRight: pos ].
			^ self resizeBottom: pos
		].
	isLeft ifTrue:[^ self resizeLeft: pos].
	isRight ifTrue:[^ self resizeRight: pos]