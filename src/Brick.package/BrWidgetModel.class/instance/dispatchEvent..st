event management
dispatchEvent: anEvent
	"I only call my event dispatcher, so the event can be only handled by my event handlers/filters"
		
	self isAttachedToWidget
		ifTrue: [ self widget dispatchEvent: anEvent ]
		ifFalse: [ self dispatchEventToMyself: anEvent ]