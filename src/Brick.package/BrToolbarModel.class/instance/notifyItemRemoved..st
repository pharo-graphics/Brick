notifying
notifyItemRemoved: aWidgetModel
	self dispatchEvent: (BrToolbarItemRemovedEvent item: aWidgetModel)