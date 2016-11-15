caret position
moveCaretTo: aTextPosition
	self editorModel moveCursorTo: aTextPosition.
	self editorModelProperty notifyValueChanged.