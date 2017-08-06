text - selection
selectAll	
	"Select the whole text in the editor without any other side effects.
	Note:
		- I don't change cursor position.
		- I request segments update"
	self
		select: 0
		to: self text size