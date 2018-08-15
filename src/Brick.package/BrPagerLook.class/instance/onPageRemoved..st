hooks
onPageRemoved: aPageModel
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the page removed event without being attached to a widget' ].

	self pages removeKey: aPageModel.
	aPageModel widgetDo: [ :aPageContentElement | aPageContentElement removeFromParent ].
	pagesListElement dataSource pageElements: self pageElements