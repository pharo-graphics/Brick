notifying
notifyItemAdded: aBrToolbarItemModel
	self dispatchEvent: (BrToolbarItemAddedEvent item: aBrToolbarItemModel)