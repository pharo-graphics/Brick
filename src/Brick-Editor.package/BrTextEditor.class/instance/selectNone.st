text - selection
selectNone
	"Deselect the whole text in the editor without any other side effects.
	Note:
		- I don't change cursor position.
		- I request segments update"
	self
		deselect: 0
		to: self text size