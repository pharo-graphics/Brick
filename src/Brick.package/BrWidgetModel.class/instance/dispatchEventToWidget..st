event management
dispatchEventToWidget: anEvent

	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I must be attached to a widget to dispatch event' ].

	self widget dispatchEvent: anEvent