text operations
removeNextChar
	self editorModel delete.
	self textModelProperty notifyValueChanged.
	