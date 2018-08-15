notifying
notifyPageAdded: aPageModel
	self dispatchEvent: (BrPagerPageAddedEvent page: aPageModel)