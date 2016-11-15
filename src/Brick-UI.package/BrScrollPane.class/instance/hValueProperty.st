accessing properties
hValueProperty
	^ hValue ifNil: [ hValue := BlObjectProperty on: self named: #hValue default: 0 ]