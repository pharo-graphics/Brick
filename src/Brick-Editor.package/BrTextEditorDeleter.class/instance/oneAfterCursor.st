api - configuration
oneAfterCursor
	"Delete one symbol after the cursor"

	self
		from: self editor cursor position
		to: ((self editor cursor position + 1) min: self editor text size)