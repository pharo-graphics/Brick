mouse handlers
clickEvent: anEvent
	anEvent consumed: true.
	
	self activated: (oneWay or: [ self isActivated not ])