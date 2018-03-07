as yet unclassified
wantsEvent: anEvent
	((anEvent isMouseUp or:[anEvent isMouseDown]) and:[self isHovered ]) ifTrue: [ ^  true].
	^ super wantsEvent: anEvent