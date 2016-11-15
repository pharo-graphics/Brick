accessing properties
borderlessProperty
	^ borderless ifNil: [ borderless := BlObjectProperty on: self named: #borderless default: false ]