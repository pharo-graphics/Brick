accessing properties
vMaxProperty
	^ vMax ifNil: [ vMax := BlObjectProperty on: self named: #vMax default: 1 ]