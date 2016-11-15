scrolling
needsScrollYInParent: positionInParent
	(positionInParent y < 5 or: [ positionInParent y > (innerContainer height - 5) ])
		ifTrue: [ widget constraints vertical resizer ifExact: [ ^ true ] ].
	^ false