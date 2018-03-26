event management
dispatchEventToMyself: anEvent

	anEvent forwardingTarget: self.
	anEvent target: self.

	(self eventDispatcher wantsEvent: anEvent)
		ifTrue: [ self eventDispatcher dispatchEvent: anEvent ]