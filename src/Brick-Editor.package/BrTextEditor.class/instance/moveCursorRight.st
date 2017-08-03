text - cursor
moveCursorRight
	"Moves cursor to the left by one character"

	self moveCursorTo: (self cursor position + 1 min: self text size).
	self selectNone