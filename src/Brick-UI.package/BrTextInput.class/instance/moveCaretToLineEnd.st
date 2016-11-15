caret position
moveCaretToLineEnd
	self editorModel moveToLineEnd.
	self editorModelProperty notifyValueChanged
	
		