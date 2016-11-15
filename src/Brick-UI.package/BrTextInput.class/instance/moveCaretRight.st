caret position
moveCaretRight
	self editorModel moveRight.
	self editorModelProperty notifyValueChanged.