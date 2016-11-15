caret position
moveCaretToEnd
	self editorModel  selection end moveToEnd.
	self editorModelProperty notifyValueChanged.
		