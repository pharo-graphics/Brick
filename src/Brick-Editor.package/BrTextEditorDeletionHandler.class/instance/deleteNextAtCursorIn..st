api - deletion
deleteNextAtCursorIn: anEditor
	"Delete currently selected text and delete a character to the right from the current cursor position"
	
	anEditor deleter
		selected;
		oneAfterCursor;
		delete