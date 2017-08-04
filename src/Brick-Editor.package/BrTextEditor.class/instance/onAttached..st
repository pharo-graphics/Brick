hooks
onAttached: anEditorElement
	super onAttached: anEditorElement.

	anEditorElement addShortcut: (BlShortcut new
		combination: (BlKeyCombination builder meta; key: Key s; build);
		action: [ self inform: 'Save!' ]).

	anEditorElement addShortcut: (BlShortcut new
		combination: (BlKeyCombination builder meta; key: Key a; build);
		action: [ self selectAll ]).

	anEditorElement addShortcut: (BlShortcut new
		combination: (BlKeyCombination builder escape; build);
		action: [ self selectNone ]).

	anEditorElement addShortcut: (BlShortcut new
		combination: (BlKeyCombination builder shift; key: Key arrowLeft; build);
		action: [ self selectToLeft ]).

	anEditorElement addShortcut: (BlShortcut new
		combination: (BlKeyCombination builder shift; key: Key arrowRight; build);
		action: [ self selectToRight ]).

	anEditorElement addShortcut: (BlShortcut new
		combination: (BlKeyCombination builder key: Key arrowLeft; build);
		action: [ self moveCursorLeft ]).

	anEditorElement addShortcut: (BlShortcut new
		combination: (BlKeyCombination builder key: Key arrowRight; build);
		action: [ self moveCursorRight ]).
	
	anEditorElement addShortcut: (BlShortcut new
		combination: (BlKeyCombination builder meta; key: Key arrowRight; build);
		action: [ self moveCursorToEndNextWord ]).

	anEditorElement addShortcut: (BlShortcut new
		combination: (BlKeyCombination builder meta; key: Key arrowLeft; build);
		action: [ self moveCursorToStartPreviousWord ]).

	anEditorElement addEventHandlerOn: BlMouseDownEvent do: [ self selectNone ]