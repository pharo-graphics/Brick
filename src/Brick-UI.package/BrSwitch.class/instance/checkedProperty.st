accessing
checkedProperty
	^ checked ifNil: [ checked := BlObjectProperty on: self named: #checked default: false ]