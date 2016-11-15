accessing properties
maxProperty
	^ max ifNil: [ max := BlObjectProperty on: self named: #max default: 100 ]