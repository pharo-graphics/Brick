text - cursor
moveCursorLeft
	"Moves cursor to the left by one character"

	self moveCursorTo: (self cursor position - 1 max: 0).
	self selectNone