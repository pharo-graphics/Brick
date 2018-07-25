initialization
initialize
	super initialize.
	
	self viewModel: (BrButtonModel new addAll: {
		labelModel := BrLabelModel new.
		iconModel := BrIconModel new})