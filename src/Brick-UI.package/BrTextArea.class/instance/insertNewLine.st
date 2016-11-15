text operations
insertNewLine
	self editorModel insert: String cr.
	self textModelProperty notifyValueChanged