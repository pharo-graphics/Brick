api - adding / removing
removePage: aPageModel
	self pages remove: aPageModel.
	self onPageRemoved: aPageModel