notifying
notifyItemAdded: aWidgetModel
	self dispatchEvent: (BrToolbarItemAddedEvent item: aWidgetModel)