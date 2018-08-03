initialization
initialize
	super initialize.

	self viewModel: (BrSimpleListModel new add: (selectionModel := BrSelectionModel new)).
	self look: BrSimpleListLook new + BrLayoutLook frame matchParent.
	
	"shortcuts only work when list has focus.
	we add an event filter on the click event to give list focus whenever users click somewhere inside"
	self
		addEventFilterOn: BlClickEvent do: [ :anEvent | anEvent currentTarget requestFocus ];
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder key: Key arrowDown; build);
			action: [ self selectNext ] );
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder key: Key arrowUp; build);
			action: [ self selectPrevious ] )