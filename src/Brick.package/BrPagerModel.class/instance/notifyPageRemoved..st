notifying
notifyPageRemoved: aPageModel
	self dispatchEvent: (BrPagerPageRemovedEvent page: aPageModel)