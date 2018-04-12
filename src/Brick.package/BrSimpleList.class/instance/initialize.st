initialization
initialize
	super initialize.

	self viewModel: BrSimpleListModel new.
	self look: BrSimpleListLook new + BrLayoutLook frame matchParent