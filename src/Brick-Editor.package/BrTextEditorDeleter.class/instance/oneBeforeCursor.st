api - configuration
oneBeforeCursor
	"Delete one symbol before the cursor"

	self
		from: ((self cursor position - 1) max: 0)
		to: self cursor position