accessing properties
textProperty
	^ text ifNil: [ text := BlObjectProperty on: self named: #text ]