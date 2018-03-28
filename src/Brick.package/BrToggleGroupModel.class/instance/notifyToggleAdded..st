notifying
notifyToggleAdded: aBrToggleModel
	self dispatchEvent: (BrToggleAddedEvent toggle: aBrToggleModel)