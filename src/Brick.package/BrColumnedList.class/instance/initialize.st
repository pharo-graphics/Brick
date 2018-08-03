initialization
initialize
	super initialize.

	self viewModel: (BrColumnedListModel new add: (selectionModel := BrSelectionModel new)).
	self look: BrColumnedListLook new + BrLayoutLook frame matchParent