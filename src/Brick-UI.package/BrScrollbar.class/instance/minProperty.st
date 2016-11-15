accessing properties
minProperty
	^ min ifNil: [ min := BlObjectProperty on: self named: #min default: 0 ]