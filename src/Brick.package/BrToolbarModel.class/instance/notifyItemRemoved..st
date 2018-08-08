notifying
notifyItemRemoved: aBrToolbarItemModel
	self dispatchEvent: (BrToolbarItemRemovedEvent item: aBrToolbarItemModel)