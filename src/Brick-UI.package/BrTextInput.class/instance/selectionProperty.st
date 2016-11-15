accessing properties
selectionProperty
	^ selection ifNil: [ selection := BlObjectProperty on: self named: #selection ]