text operations
clear
	self editorModel selectAll.
	self editorModel selection delete.
	self textModelProperty notifyValueChanged.