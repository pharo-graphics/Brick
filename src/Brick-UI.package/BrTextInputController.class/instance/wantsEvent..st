event handling
wantsEvent: anEvent
	((anEvent isTextInput or:[anEvent isMouse]) or:[anEvent isBaseDrag])
		ifTrue: [ ^ true ].
	^ super wantsEvent: anEvent