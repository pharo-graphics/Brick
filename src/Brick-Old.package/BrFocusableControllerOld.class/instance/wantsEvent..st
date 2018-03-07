as yet unclassified
wantsEvent: anEvent
	(anEvent isBaseFocus or:[anEvent isMouseDown])
		ifTrue: [ ^  true  ].
	^ super wantsEvent: anEvent