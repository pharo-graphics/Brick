caret position
moveCaretDown
	self editorModel moveDown.
	self editorModelProperty notifyValueChanged.
	
		