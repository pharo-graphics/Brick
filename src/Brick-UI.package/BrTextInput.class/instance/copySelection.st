selection
copySelection
	self editorModel selection isEmpty ifTrue: [ ^ self ].
	Clipboard clipboardText: self editorModel selection asString