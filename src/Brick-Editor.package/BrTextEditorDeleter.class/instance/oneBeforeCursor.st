api - configuration
oneBeforeCursor
	"Delete one symbol before the cursor"

	self
		from: ((self editor cursor position - 1) max: 0)
		to: self editor cursor position