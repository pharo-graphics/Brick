initialization
initialize
	super initialize.
	
	"Default cursor position should be 0,
	which means that it will be before the first text item (character) if it exists"
	position := 0