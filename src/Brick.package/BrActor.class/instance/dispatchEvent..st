event management
dispatchEvent: anEvent
	"I only call my event dispatcher, so the event can be only handled by my event handlers/filters"
	"we should not dispatch an event that was sent by me"

	anEvent hasSource
		ifFalse: [ anEvent source: self ].

	"first, we dispatch to my direct listeners"
	self dispatchEventToMyself: anEvent.

	"then let the rest of the element components receive it"
	self isAttachedToWidget
		ifTrue: [ self dispatchEventToWidget: anEvent ]