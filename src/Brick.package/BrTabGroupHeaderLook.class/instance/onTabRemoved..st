hooks
onTabRemoved: aBrTabModel
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the tab removed event without being attached to a widget' ].

	self tabs removeKey: aBrTabModel.
	aBrTabModel widgetDo: [ :aTabElement |
		self tabbar removeChild: aTabElement ]