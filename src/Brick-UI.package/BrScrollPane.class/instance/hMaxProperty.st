accessing properties
hMaxProperty
	^ hMax ifNil: [ hMax := BlObjectProperty on: self named: #hMax default: 1 ]