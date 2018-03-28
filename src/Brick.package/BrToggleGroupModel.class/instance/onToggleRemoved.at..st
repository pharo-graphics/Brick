hooks
onToggleRemoved: aBrToggleModel at: anIndex
	self
		assert: [ aBrToggleModel isNotNil ]
		description: [ 'Removed toggle must not be nil' ].

	self notifyToggleRemoved: aBrToggleModel