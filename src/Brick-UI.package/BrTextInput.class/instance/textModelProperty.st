accessing properties
textModelProperty
	^ textModel
		ifNil: [ textModel := BlObjectProperty
				on: self
				named: #textModel
				default: '' asTxModel ]