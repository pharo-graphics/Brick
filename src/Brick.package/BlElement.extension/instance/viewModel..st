*Brick
viewModel: aBrToggleModel
	self removeEventHandler: self viewModel.
	self userData at: #brickViewModel put: aBrToggleModel.
	self addEventHandler: aBrToggleModel