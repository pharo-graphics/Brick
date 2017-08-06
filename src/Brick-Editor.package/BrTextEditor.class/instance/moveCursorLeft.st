text - cursor
moveCursorLeft
	"Moves cursor to the left by one character without any other side effects.
	Note:
		- I don't change current selection.
		- I request segments update"

	self moveCursorTo: (self cursor position - 1 max: 0)