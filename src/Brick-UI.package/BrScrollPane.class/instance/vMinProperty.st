accessing properties
vMinProperty
	^ vMin ifNil: [ vMin := BlObjectProperty on: self named: #vMin default: 0 ]