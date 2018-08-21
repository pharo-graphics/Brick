api - items
removeItem: aWidgetModel
	| anItemIndex |

	anItemIndex := self items indexOf: aWidgetModel.
	self items remove: aWidgetModel.
	self onItemRemoved: aWidgetModel at: anItemIndex