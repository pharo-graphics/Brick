mouse handlers
clickEvent: anEvent
	anEvent consumed: true.

	self isEnabled ifTrue: [ self select ]