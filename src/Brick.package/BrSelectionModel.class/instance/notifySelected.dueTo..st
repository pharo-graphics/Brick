notifying
notifySelected: anInterval dueTo: aSourceEvent
	self dispatchEvent: (BrSelectionChanged new selection: self selection; selectedInterval: anInterval; sourceEvent: aSourceEvent)