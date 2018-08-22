api - modification
insertAtCursor: aString
	"Insert a given string at a cursor position deleting currently selected text"
	| anOldCursorPosition |

	self deleteSelected.

	anOldCursorPosition := self cursor position.

	self
		insertString: aString
		at: self cursor position.

	"somebody changed cursor position as a reaction to the insertion event.
	In this case we should not take any cursor movement actions and let users control it"
	self cursor position = anOldCursorPosition
		ifFalse: [ ^ self ].

	self moveCursorTo: anOldCursorPosition + aString size