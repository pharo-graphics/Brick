accessing properties
unitIncrementProperty
	^ unitIncrement 
		ifNil: [ unitIncrement := BlObjectProperty on: self named: #unitIncrement default: 1]