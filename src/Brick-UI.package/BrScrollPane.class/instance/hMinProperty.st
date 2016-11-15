accessing properties
hMinProperty
	^ hMin ifNil: [ hMin := BlObjectProperty on: self named: #hMin default: 0 ]