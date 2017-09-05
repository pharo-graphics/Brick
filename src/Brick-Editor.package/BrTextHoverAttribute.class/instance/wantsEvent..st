events
wantsEvent: anEvent
	^ (anEvent isKindOf: BlMouseEnterEvent)
		or: [ anEvent isKindOf: BlMouseLeaveEvent ]