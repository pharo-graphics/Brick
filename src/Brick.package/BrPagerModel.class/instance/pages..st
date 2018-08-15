accessing
pages: aCollectionOfPages
	pages := aCollectionOfPages.
	
	self dispatchEvent: (BrPagerPagesChanged pages: self pages)