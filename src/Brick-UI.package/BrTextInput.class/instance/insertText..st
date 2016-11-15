text operations
insertText: aString 
	self editorModel insert: aString.
	self textModelProperty notifyValueChanged