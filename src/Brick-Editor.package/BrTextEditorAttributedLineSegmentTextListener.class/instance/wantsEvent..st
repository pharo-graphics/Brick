events
wantsEvent: anEvent
	^ (anEvent isKindOf: BlMouseEvent)
		and: [ anEvent currentTarget text isNotEmpty ]