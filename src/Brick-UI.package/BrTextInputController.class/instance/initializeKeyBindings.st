key bindings
initializeKeyBindings
	"
	self keyBindings
		add: (BlKeyCodeCombination char: Character arrowLeft action: #moveCaretLeft);
		add: (BlKeyCodeCombination char: Character arrowRight action: #moveCaretRight);
		add: (BlKeyCodeCombination char: Character backspace action: #removePrevChar);
		add: (BlKeyCodeCombination char: Character delete  action: #removeNextChar);
		add: (BlKeyCodeCombination char: Character pageUp  action: #moveCaretToStart);
		add: (BlKeyCodeCombination char: Character pageDown  action: #moveCaretToEnd).
	self keyBindings
		add: (BlKeyCodeCombination char: Character arrowLeft  action: #extendSelectionLeft) shift;
		add: (BlKeyCodeCombination char: Character arrowRight  action: #extendSelectionRight) shift.
	self keyBindings
		add: (BlKeyCodeCombination char: $a action: #selectAll) ctrl;
		add: (BlKeyCodeCombination char: $z action: #undo) ctrl;
		add: (BlKeyCodeCombination char: $x action: #cutSelection) ctrl;
		add: (BlKeyCodeCombination char: $c action: #copySelection) ctrl;
		add: (BlKeyCodeCombination char: $v action: #paste) ctrl"