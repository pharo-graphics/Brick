caret position
moveCaretUp
	self editorModel moveUp.
	self editorModelProperty notifyValueChanged
	
		