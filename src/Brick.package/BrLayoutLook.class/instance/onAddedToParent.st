hooks
onAddedToParent
	self updateAlignment.
	
	self targetElement parent
		when: BlElementLayoutChangedEvent
		do: [ self onLayoutChanged ]