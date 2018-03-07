as yet unclassified
wantsEvent: anEvent
	self isDisabled ifTrue:[^ false].
	anEvent isMouseLeave
		ifTrue: [ ^  self isHovered ].
	anEvent isMouseEnter ifTrue:[^ true].
	^ super wantsEvent: anEvent