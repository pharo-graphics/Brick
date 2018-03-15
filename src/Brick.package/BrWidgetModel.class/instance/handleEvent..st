event handling
handleEvent: anEvent
	| aCurrentTarget |
	super handleEvent: anEvent.

	"We should restore current event target after forwarding "
	aCurrentTarget := anEvent currentTarget.
	[ self dispatchEventToMyself: anEvent ]
		ensure: [ anEvent currentTarget: aCurrentTarget ]