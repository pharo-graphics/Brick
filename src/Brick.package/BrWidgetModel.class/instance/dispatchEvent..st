event management
dispatchEvent: anEvent
	"I only call my event dispatcher, so the event can be only handled by my event handlers/filters"
	"we should not dispatch an event that was sent by me"

	anEvent hasSource
		ifFalse: [ anEvent source: self ].

	self isAttachedToWidget
		ifTrue: [ self dispatchEventToWidget: anEvent ]
		ifFalse: [ self dispatchEventToMyself: anEvent ]