api - configuration
oneAfterCursor
	"Delete one symbol after the cursor"

	self
		from: self cursor position
		to: ((self cursor position + 1) min: self text size)