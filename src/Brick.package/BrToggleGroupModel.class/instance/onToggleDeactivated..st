hooks
onToggleDeactivated: aBrToggleModel

	self
		assert: [ aBrToggleModel isNotNil ]
		description: [ 'Deactivated toggle must not be nil' ].

	self
		assert: [ self toggles allSatisfy: [ :eachToggleModel | eachToggleModel isActivated not ] ]
		description: [ 'There must be no activated toggle' ].
	
	self
		assert: [ aBrToggleModel == activatedToggle ]
		description: [ 'Deactivated toggle must be known as activated' ].
	
	activatedToggle := nil