hooks
onToggleActivated: aToggleModel
	self toggles
		select: [ :eachToggle | eachToggle ~~ aToggleModel ]
		thenDo: #deactivate