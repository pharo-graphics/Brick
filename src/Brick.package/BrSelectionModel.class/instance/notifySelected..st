notifying
notifySelected: anInterval
	self dispatchEvent: (BrSelectionChanged new selection: self selection; selectedInterval: anInterval)