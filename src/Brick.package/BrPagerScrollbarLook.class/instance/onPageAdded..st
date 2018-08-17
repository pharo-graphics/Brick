hooks
onPageAdded: aPageModel
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the page added event without being attached to a widget' ].

	self pages at: aPageModel put: nil.

	aPageModel whenAttachedDo: [ :aPageContentElement |
		self pages at: aPageModel put: aPageContentElement.
		self updatePagePreviews ]