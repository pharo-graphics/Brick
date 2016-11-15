accessing properties
borderRadiusProperty
	^ borderRadius ifNil: [ borderRadius := BlObjectProperty on: self named: #borderRadius default: 0]