api - adding / removing
addPage: aPageModel
	self pages add: aPageModel.
	self onPageAdded: aPageModel