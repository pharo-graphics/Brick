event handling
handleEvent: anEvent
	| aCurrentTarget aTarget |
	super handleEvent: anEvent.

	"We should restore current event target after forwarding "
	aCurrentTarget := anEvent currentTarget.
	aTarget := anEvent target.
	[ self dispatchEventToMyself: anEvent ]
		ensure: [
			anEvent currentTarget: aCurrentTarget.
			anEvent target: aTarget ]