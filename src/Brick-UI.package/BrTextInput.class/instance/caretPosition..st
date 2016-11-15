accessing
caretPosition: aTextPosition
	self editorModel cursorPosition: aTextPosition.
	self editorModelProperty notifyValueChanged