adding / removing
addToggle: aToggle
	self toggles add: aToggle.

	aToggle viewModel beOneWay.
	aToggle when: BrToggleActivatedEvent do: [ :anEvent | self onToggleActivated: anEvent currentTarget ].
	
	widget addChild: aToggle