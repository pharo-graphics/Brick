children hooks
onAddedToSceneGraph
	super onAddedToSceneGraph.

	self space addShortcut: (BlShortcut new 
		combination: (BlKeyCodeCombination new cmd; char: $r);
		action: [ self replace ]).
		
	self space addShortcut: (BlShortcut new 
		combination: (BlKeyCodeCombination new cmd; char: $e);
		action: [ self embed ]).
		
	self space addShortcut: (BlShortcut new 
		combination: (BlKeyCodeCombination new cmd; char: $p);
		action: [ self printIt ])