notifying
notifyToggleRemoved: aBrToggleModel
	self dispatchEvent: (BrToggleRemovedEvent toggle: aBrToggleModel)