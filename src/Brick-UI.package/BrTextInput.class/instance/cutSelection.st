selection
cutSelection
	self editorModel selection isEmpty ifTrue: [ ^ self ].
	Clipboard clipboardText: self editorModel selection asString.
	self editorModel selection cut.
	self textModelProperty notifyValueChanged.
	