event management
dispatchEventToMyself: anEvent
	anEvent forwardingTarget: self.
	(self eventDispatcher wantsEvent: anEvent)
		ifTrue: [ self eventDispatcher dispatchEvent: anEvent ]