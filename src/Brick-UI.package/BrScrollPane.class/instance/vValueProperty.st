accessing properties
vValueProperty
	^ vValue ifNil: [ vValue := BlObjectProperty on: self named: #vValue default: 0 ]