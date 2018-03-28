hooks
onToggleDeactivated: aBrToggleModel

	self
		assert: [ aBrToggleModel isNotNil ]
		description: [ 'Deactivated toggle must not be nil' ].

	self
		assert: [ aBrToggleModel == self activatedToggle ]
		description: [ 'Deactivated toggle must be known as activated' ].
	
	
	activatedToggle := nil