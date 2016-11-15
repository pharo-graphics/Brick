accessing properties
orientationProperty
	^ orientation 
		ifNil: [ orientation := BlObjectProperty on: self named: #orientation ]