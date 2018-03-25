event management
dispatchEventToMyself: anEvent
	(anEvent hasSource
		and: [ anEvent source == self ])
			ifTrue: [ ^ self ].

	anEvent forwardingTarget: self.
	(self eventDispatcher wantsEvent: anEvent)
		ifTrue: [ self eventDispatcher dispatchEvent: anEvent ]