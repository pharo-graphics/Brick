adding / removing
addToggle: aToggleModel

	self toggles add: aToggleModel.

	aToggleModel beOneWay.
	aToggleModel when: BrToggleActivatedEvent do: [ :anEvent | self onToggleActivated: anEvent currentTarget ]