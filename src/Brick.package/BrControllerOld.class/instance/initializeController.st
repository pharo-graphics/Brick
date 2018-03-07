initialization
initializeController
	widget addEventHandler: (BlEventHandler on: BlKeyDownEvent do: [ :e |  self performActionForEvent: e ]).
	widget disabledProperty onChangedDo: [ :v | self toggleState: BlDisabledState ]