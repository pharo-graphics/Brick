text operations
removePrevChar
	self editorModel backspace.
	self textModelProperty notifyValueChanged.