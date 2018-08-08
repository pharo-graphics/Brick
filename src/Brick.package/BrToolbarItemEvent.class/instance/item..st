accessing
item: aBrToolbarModel
	self
		assert: [ aBrToolbarModel notNil ]
		description: [ 'Toolbar item must be non-nil' ].

	item := aBrToolbarModel