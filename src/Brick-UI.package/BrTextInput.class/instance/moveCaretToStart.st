caret position
moveCaretToStart
	self editorModel  selection end moveToStart.
	self editorModelProperty notifyValueChanged
	
		