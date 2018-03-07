accessing
viewModel: aBrToggleModel
	self removeEventHandler: self viewModel.
	viewModel := aBrToggleModel.
	self addEventHandler: self viewModel