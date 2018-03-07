accessing properties
backgroundColorProperty
	^ backgroundColor
		ifNil: [ backgroundColor := BlObjectProperty on: self named: #backgroundColor  default: Color white ]