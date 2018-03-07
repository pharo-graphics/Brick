accessing properties
disabledProperty
	^ disabled ifNil: [ disabled := BlObjectProperty on: self named: #disabled default: false]