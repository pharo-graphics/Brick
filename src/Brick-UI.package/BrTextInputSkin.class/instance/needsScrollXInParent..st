scrolling
needsScrollXInParent: positionInParent
	(positionInParent x < 5 or: [ positionInParent x > (innerContainer width - 5) ])
		ifTrue: [ ^ true ].
	^ false