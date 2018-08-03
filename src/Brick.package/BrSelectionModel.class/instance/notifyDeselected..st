notifying
notifyDeselected: anInterval
	self dispatchEvent: (BrSelectionChanged new selection: self selection; deselectedInterval: anInterval)