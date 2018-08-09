api - items
removeItem: aBrToolbarItemModel
	| anItemIndex |
	anItemIndex := self items indexOf: aBrToolbarItemModel.
	self items remove: aBrToolbarItemModel.
	self onItemRemoved: aBrToolbarItemModel at: anItemIndex.