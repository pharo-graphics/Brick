event handling
mapEvent: anEvent
	(anEvent isKindOf: BrToggleActivatedEvent)
		ifTrue: [ self toggleActivated ].
	(anEvent isKindOf: BrToggleDeactivatedEvent)
		ifTrue: [ self toggleDeactivated ].
	(anEvent isKindOf: BrToggleEnabledEvent)
		ifTrue: [ self toggleEnabled ].
	(anEvent isKindOf: BrToggleDisabledEvent)
		ifTrue: [ self toggleDisabled ]