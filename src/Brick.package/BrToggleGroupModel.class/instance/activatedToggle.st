api - toggles
activatedToggle
	<return: #BrToggleModel>
	
	self
		assert: [ self hasActivatedToggle ]
		description: [ 'Can not access an activated toggle if there is no one' ].
		
	^ activatedToggle