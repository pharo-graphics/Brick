accessing
groupProperty
	^ groupProperty ifNil: [ groupProperty := BlObjectProperty on: self named: #group ]