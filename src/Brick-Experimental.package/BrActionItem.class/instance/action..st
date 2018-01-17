as yet unclassified
action: aBlock
	self eventDispatcher
		removeEventHandlers;
		addEventHandler: (BrOnClickHandler do: aBlock)