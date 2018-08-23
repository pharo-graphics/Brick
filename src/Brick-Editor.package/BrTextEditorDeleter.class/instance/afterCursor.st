api - configuration
afterCursor
	"Delete all text after the cursor"

	self
		from: self cursor position
		to: self text size