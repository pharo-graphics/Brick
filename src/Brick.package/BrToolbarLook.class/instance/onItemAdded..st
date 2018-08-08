hooks
onItemAdded: aBrToolbarItemModel
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the item added event without being attached to a widget' ].

	self items at: aBrToolbarItemModel put: nil.

	aBrToolbarItemModel whenAttachedDo: [ :aToolbarItemElement |
		self widgetContent removeChildren: self itemElements.
		self items at: aBrToolbarItemModel put: aToolbarItemElement.
		self widgetContent addChildren: self itemElements ]