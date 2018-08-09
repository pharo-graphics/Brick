hooks
onItemRemoved: aBrToolbarItemModel
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the item removed event without being attached to a widget' ].

	self items removeKey: aBrToolbarItemModel.

	aBrToolbarItemModel widgetDo: [ :aToolbarItemElement |
		self widgetContent removeChild: aToolbarItemElement ]