accessing
tab: aBrTabModel
	self
		assert: [ aBrTabModel isNotNil ]
		description: [ 'Tab must not be nil' ].

	tab := aBrTabModel