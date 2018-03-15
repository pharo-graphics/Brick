notifying
notifyTabRemoved: aBrTabModel
	self dispatchEvent: (BrTabRemovedEvent tab: aBrTabModel)