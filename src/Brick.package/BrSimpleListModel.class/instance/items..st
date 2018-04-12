api - accessing
items: aCollectionOfBrWidgetModel

	items := aCollectionOfBrWidgetModel.
	self dispatchEvent: (BrListItemsChangedEvent items: self items)