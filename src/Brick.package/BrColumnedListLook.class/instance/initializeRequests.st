initialization
initializeRequests
	super initializeRequests.
	
	self request: BrListItemsRequest new.
	self request: BrListColumnsRequest new