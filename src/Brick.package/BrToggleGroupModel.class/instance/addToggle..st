adding / removing
addToggle: aToggle
	toggles add: aToggle.

	aToggle viewModel beOneWay.
	aToggle when: BrToggleActivatedEvent do: [ :anEvent | self onToggleActivated: anEvent currentTarget ].
	
	widget addChild: aToggle