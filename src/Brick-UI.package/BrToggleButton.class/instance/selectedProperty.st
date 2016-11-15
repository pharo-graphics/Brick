accessing
selectedProperty
	^ selectedProperty
		ifNil: [ selectedProperty := BlObjectProperty on: self named: #selected default: false ]