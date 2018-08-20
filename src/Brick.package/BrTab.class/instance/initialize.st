initialization
initialize
	super initialize.

	self viewModel: (BrTabModel new + 
		(labelModel := BrLabelModel new) +
		(iconModel := BrIconModel new))