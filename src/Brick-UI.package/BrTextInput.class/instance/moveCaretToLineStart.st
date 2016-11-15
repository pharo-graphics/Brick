caret position
moveCaretToLineStart
	self editorModel moveToLineStart.
	self editorModelProperty notifyValueChanged
	
		