event handling
handleEvent: anEvent
	| aCurrentTarget aTarget |
	
	self looks do: [ :aLook | aLook handleEvent: anEvent ].
	
	"do not handle outgoing events"
	(anEvent source == self)
		ifTrue: [ ^ self ].

	"We should restore current event target after forwarding "
	aCurrentTarget := anEvent currentTarget.
	aTarget := anEvent target.
	[ self dispatchEventToMyself: anEvent ]
		ensure: [
			anEvent currentTarget: aCurrentTarget.
			anEvent target: aTarget ]