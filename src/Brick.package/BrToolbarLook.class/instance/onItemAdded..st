hooks
onItemAdded: aWidgetModel
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the item added event without being attached to a widget' ].

	self items at: aWidgetModel put: nil.

	aWidgetModel whenAttachedDo: [ :aToolbarItemElement |
		self widgetContent removeChildren: self itemElements.
		self items at: aWidgetModel put: aToolbarItemElement.
		self widgetContent addChildren: self itemElements ]