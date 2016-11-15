accessing properties
withButtonsProperty
	^ withButtons
		ifNil: [ withButtons := BlObjectProperty on: self named: #withButtons default: true ]