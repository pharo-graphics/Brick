api - modification
deleteNextAtCursor
	"Delete currently selected text and delete a character to the right from the current cursor position"
	
	self deleter
		selected;
		oneAfterCursor;
		delete