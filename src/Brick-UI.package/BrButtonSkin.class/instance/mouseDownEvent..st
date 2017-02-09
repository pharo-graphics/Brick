mouse handlers
mouseDownEvent: anEvent
	ripple scaleTo: 1 @ 1.
	ripple extent: (widget extent max) asPoint.
	ripple position: (widget globalPointToLocal: anEvent position) - (widget extent / 2).
	rippleAnimation isRunning ifTrue: [ rippleAnimation stop ].
	rippleAnimation start.
	super mouseDownEvent: anEvent