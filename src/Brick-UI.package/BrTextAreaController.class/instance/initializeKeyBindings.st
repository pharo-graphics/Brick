key bindings
initializeKeyBindings
	super initializeKeyBindings.
	"
	self keyBindings
		add: (BlKeyCodeCombination char: Character arrowUp action: #moveCaretUp);
		add: (BlKeyCodeCombination char: Character arrowDown  action: #moveCaretDown);
		add: (BlKeyCodeCombination char: Character cr  action: #insertNewLine).
		
	self keyBindings
		add: (BlKeyCodeCombination char: Character arrowUp  action: #extendSelectionUp) shift;
		add: (BlKeyCodeCombination char: Character arrowDown  action: #extendSelectionDown) shift."
	