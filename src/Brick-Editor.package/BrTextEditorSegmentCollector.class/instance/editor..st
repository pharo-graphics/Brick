accessing
editor: aBrTextEditor
	self
		assert: [ editor isNil ]
		description: [ 'Can only be attached once' ].
	
	editor := aBrTextEditor