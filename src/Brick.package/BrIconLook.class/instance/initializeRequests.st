initialization
initializeRequests
	super initializeRequests.

	"Request to update an icon as soon as we are bound to the widget"
	self request: BrLabelRequest new