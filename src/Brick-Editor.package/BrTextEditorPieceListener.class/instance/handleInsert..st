keyboard handlers
handleInsert: anEvent
	"| aString aCursorPosition |

	aString := anEvent char asString.
	aCursorPosition := self editor cursor position	.

	self editor
		insertString: aString
		at: aCursorPosition.

	self editor moveCursorTo: aCursorPosition + aString size"