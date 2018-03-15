notifying
notifyTabAdded: aBrTabModel
	self dispatchEvent: (BrTabAddedEvent tab: aBrTabModel)