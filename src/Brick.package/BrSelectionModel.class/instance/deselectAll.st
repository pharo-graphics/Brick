api - selection
deselectAll
	"Deselect all items"

	self selection reverseDo: [ :aMonotoneSelection | self deselect: aMonotoneSelection from to: aMonotoneSelection to ]