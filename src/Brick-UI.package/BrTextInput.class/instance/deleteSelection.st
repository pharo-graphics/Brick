selection
deleteSelection
	self editorModel selection isEmpty ifTrue: [ ^ self ].
	self editorModel selection cut.
	self textModelProperty notifyValueChanged.
	