api - modification
deletePreviousAtCursor
	"Delete currently selected text and delete a character to the left from the current cursor position"

	self hasSelection
		ifTrue: [ ^ self deleteSelected ].

	self cursor position <= 0
		ifTrue: [ ^ self ].

	self
		delete: self cursor position - 1
		to: self cursor position.

	self moveCursorTo: self cursor position - 1