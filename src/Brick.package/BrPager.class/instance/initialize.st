initialization
initialize
	super initialize.
	
	self look: BrPagerScrollbarLook new + BrPagerLook new + BrLayoutLook linearVertical.
	self viewModel: BrPagerModel new