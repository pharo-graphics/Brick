accessing properties
borderWidthProperty
	^ borderWidth ifNil: [ borderWidth := BlObjectProperty on: self named: #borderWidth default: 0]