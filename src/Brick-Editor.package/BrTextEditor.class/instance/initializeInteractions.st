interactions
initializeInteractions

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder meta; key: Key s; build);
		action: [ self inform: 'Save!' ]).

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder meta; key: Key a; build);
		action: [ self selectAll ]).

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder escape; build);
		action: [ self selectNone ]).

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder shift; key: Key arrowLeft; build);
		action: [ self selectToLeft ]).

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder shift; key: Key arrowRight; build);
		action: [ self selectToRight ]).

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder key: Key arrowLeft; build);
		action: [ self moveCursorLeft ]).

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder key: Key arrowRight; build);
		action: [ self moveCursorRight ]).
	
	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder meta; key: Key arrowRight; build);
		action: [ self moveCursorToEndNextWord ]).

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder meta; key: Key arrowLeft; build);
		action: [ self moveCursorToStartPreviousWord ]).