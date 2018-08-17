hooks
onPageRemoved: aPageModel
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the page removed event without being attached to a widget' ].
	
	(self pages at: aPageModel) removeEventHandlersSuchThat: [ :each | each isKindOf: BrPagerPagePreviewResizeListener ].
	self pages removeKey: aPageModel.
	self updatePagePreviews