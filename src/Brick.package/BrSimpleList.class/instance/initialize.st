initialization
initialize
	super initialize.

	self viewModel: (BrSimpleListModel new add: (selectionModel := BrSelectionModel new)).
	self look: BrSimpleListLook new + BrLayoutLook frame matchParent