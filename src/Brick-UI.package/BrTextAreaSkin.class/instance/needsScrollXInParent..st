scrolling
needsScrollXInParent: positionInParent
	(super needsScrollXInParent: positionInParent)
		ifTrue: [ widget isWrapText ifFalse: [ ^ true ] ].
	^ false