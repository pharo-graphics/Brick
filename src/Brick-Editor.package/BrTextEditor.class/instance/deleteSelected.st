text - modifications
deleteSelected
	"Delete selected piece of text without cursor or selection update.
	Note: cursor or selection location after deletion may be invalid!"

	self selection do: [ :aMonotoneSelection |
		self
			delete: aMonotoneSelection from
			to: aMonotoneSelection to ]