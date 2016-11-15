as yet unclassified
wantsEvent: anEvent
	(anEvent isMouse or: [ anEvent isBaseDrag ])
		ifTrue: [ ^ true ].
	^ super wantsEvent: anEvent