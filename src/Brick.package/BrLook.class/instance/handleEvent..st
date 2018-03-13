event handling
handleEvent: anEvent
	| aCurrentTarget |
	super handleEvent: anEvent.

	self looks do: [ :aLook | aLook handleEvent: anEvent ].

	"We should restore current event target after forwarding "
	aCurrentTarget := anEvent currentTarget.
	[ self dispatchEvent: anEvent ]
		ensure: [ anEvent currentTarget: aCurrentTarget ]