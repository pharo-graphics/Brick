api - modification
insertAtCursor: aString
	"Insert a given string at a cursor position deleting currently selected text"
	
	self deleteSelected.

	self
		insertString: aString
		at: self cursor position.

	self moveCursorTo: self cursor position + aString size