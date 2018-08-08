initialization
initialize
	super initialize.
	self viewModel: BrToolbarItemModel new.
	self flag: 'Do we actually need this element? Maybe having BrToolbarItemModel is enough.'