initialization
initialize
	super initialize.

	self viewModel: (BrColumnedListModel new add: (selectionModel := BrSelectionModel new)).
	self look: BrColumnedListLook new + BrLayoutLook frame matchParent.
	self rowStencil: BrListClickableRowStencilBuilder new.
	
	"shortcuts only work when list has focus.
	we add an event filter on the click event to give list focus whenever users click somewhere inside"
	self
		addEventFilterOn: BlClickEvent do: [ :anEvent | anEvent currentTarget requestFocus ];
		when: BrListItemElementAttached do: [ :anEvent |
			(selectionModel contains: anEvent rowIndex)
				ifTrue: [ self dispatchEvent: (BrListSelectedItemAttached new
					itemElement: anEvent itemElement;
					rowIndex: anEvent rowIndex;
					rowValue: anEvent rowValue) ] ];
		when: BrListItemElementDetached do: [ :anEvent |
			(selectionModel contains: anEvent rowIndex)
				ifTrue: [ self dispatchEvent: (BrListSelectedItemDetached new
					itemElement: anEvent itemElement;
					rowIndex: anEvent rowIndex;
					rowValue: anEvent rowValue) ] ];
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder key: Key arrowDown; build);
			action: [ self selectNext ] );
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder key: Key arrowUp; build);
			action: [ self selectPrevious ] )