api - modification
deletePreviousAtCursor
	"Delete currently selected text and delete a character to the left from the current cursor position"

	self deleter
		selected;
		oneBeforeCursor;
		delete