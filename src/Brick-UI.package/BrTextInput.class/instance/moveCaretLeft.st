caret position
moveCaretLeft
	self editorModel moveLeft.
	self editorModelProperty notifyValueChanged.
		