api - deletion
deletePreviousAtCursorIn: anEditor
	"Delete currently selected text and delete a character to the left from the current cursor position"

	anEditor deleter
		selected;
		oneBeforeCursor;
		delete