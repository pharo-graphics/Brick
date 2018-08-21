api - items
addItem: aWidgetModel
	self
		assert: [ aWidgetModel isNotNil ]
		description: [ 'Can not add nil widget model' ].

	self items add: aWidgetModel.
	self onItemAdded: aWidgetModel