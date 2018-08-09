hooks
onTabAdded: aBrTabModel
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the tab added event without being attached to a widget' ].

	self tabs at: aBrTabModel put: nil.

	aBrTabModel whenAttachedDo: [ :aTabElement |
		self tabbar removeChildren: self tabElements.
		self tabs at: aBrTabModel put: aTabElement.
		self tabbar addChildren: self tabElements ]