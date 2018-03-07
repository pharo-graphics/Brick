event handling
mapEvent: anEvent
	super mapEvent: anEvent.

	(anEvent isKindOf: BrToggleLabelChanged)
		ifTrue: [ self labelChanged ]