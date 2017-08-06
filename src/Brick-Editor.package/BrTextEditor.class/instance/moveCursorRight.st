text - cursor
moveCursorRight
	"Moves cursor to the right by one character without any other side effects.
	Note:
		- I don't change current selection.
		- I request segments update"

	self moveCursorTo: (self cursor position + 1 min: self text size)