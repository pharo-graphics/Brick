interactions
initializeInteractions

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder meta; key: Key s; build);
		action: [ self inform: 'Save!' ]).

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder meta; key: Key a; build);
		action: [ self selectAll ]).
	
	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder meta; key: Key x; build);
		action: [ self cutSelected ]).
		
	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder meta; key: Key c; build);
		action: [ self copySelected ]).
		
	"Paste a text from the clipboard at the current cursor position.
	I delete any currently selected text and update cursor position"
	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder meta; key: Key v; build);
		action: [ self paster fromClipboard atCursor paste ]).

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder escape; build);
		action: [ self selectNone ]).

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder shift; key: Key arrowLeft; build);
		action: [ self selectToLeft ]).

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder shift; key: Key arrowRight; build);
		action: [ self selectToRight ]).

	"left-arrow => move cursor left"
	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder key: Key arrowLeft; build);
		action: [ self moveCursorLeft ]).

	"right-arrow => move cursor right"
	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder key: Key arrowRight; build);
		action: [ self moveCursorRight ]).
	
	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder meta; key: Key arrowRight; build);
		action: [ self moveCursorToEndNextWord ]).

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder meta; key: Key arrowLeft; build);
		action: [ self moveCursorToStartPreviousWord ]).