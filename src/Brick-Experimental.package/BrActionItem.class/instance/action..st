as yet unclassified
action: aBlock
	self eventDispatcher
		removeEventHandlers;
		addEventHandler: (BlOnClickHandler do: aBlock)