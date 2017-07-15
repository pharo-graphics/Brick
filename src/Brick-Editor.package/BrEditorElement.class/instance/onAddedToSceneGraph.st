children hooks
onAddedToSceneGraph
	super onAddedToSceneGraph.

	self space addShortcut: (BlShortcut new 
		combination: (BlKeyCodeCombination new cmd; key: Key r);
		action: [ self replace ]).
		
	self space addShortcut: (BlShortcut new 
		combination: (BlKeyCodeCombination new cmd; key: Key e);
		action: [ self embed ]).
		
	self space addShortcut: (BlShortcut new 
		combination: (BlKeyCodeCombination new cmd; key: Key p);
		action: [ self printIt ])