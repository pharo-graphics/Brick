accessing properties
editorModelProperty
	^ editorModel
		ifNil: [ editorModel := BlObjectProperty
				on: self
				named: #editorModel
				default: (TxTextEditor text: self textModel) ]