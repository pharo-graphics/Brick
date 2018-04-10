initialization
initialize
	super initialize.
	
	self viewModel: BrColumnedListModel new.
	self look: BrColumnedListLook new + BrLayoutLook frame matchParent