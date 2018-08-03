initialization
initializeRequests
	super initializeRequests.
	
	self request: BrListItemsRequest new.
	self request: BrSelectionRequest new