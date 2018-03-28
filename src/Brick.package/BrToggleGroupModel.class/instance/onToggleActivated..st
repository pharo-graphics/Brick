hooks
onToggleActivated: aBrToggleModel
	self
		assert: [ aBrToggleModel isNotNil ]
		description: [ 'Activated toggle must not be nil' ].
		
	self toggles
		select: [ :eachToggle | eachToggle ~~ aBrToggleModel ]
		thenDo: #deactivate.
		
	activatedToggle := aBrToggleModel