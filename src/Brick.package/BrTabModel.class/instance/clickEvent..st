mouse handlers
clickEvent: anEvent
	"self isEnabled
		ifFalse: [ ^ self ]."

	anEvent consumed: true.
	self select