accessing
text: aString
	self textModel replaceAllWith: aString asTxModel.
	self editorModel text: self textModel.
	self textModelProperty notifyValueChanged.