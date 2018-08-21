hooks
onItemRemoved: aWidgetModel
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the item removed event without being attached to a widget' ].

	self items removeKey: aWidgetModel.

	aWidgetModel widgetDo: [ :aToolbarItemElement |
		self widgetContent removeChild: aToolbarItemElement ]