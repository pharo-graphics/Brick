accessing properties
borderColorProperty
	^ borderColor ifNil: [ 
		borderColor := BlObjectProperty on: self named: #borderColor default: Color transparent ]