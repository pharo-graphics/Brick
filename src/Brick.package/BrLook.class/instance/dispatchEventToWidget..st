event management
dispatchEventToWidget: anEvent

	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I must be attached to a widget to dispatch event' ].

	"anEvent forwardingTarget: self."
	self widget dispatchEvent: anEvent