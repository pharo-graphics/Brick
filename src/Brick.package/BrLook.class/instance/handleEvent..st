event handling
handleEvent: anEvent
	super handleEvent: anEvent.
	self mapEvent: anEvent.
	
	self looks do: [ :aLook | aLook handleEvent: anEvent ]