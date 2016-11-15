accessing properties
placeholderProperty
	^ placeholder ifNil: [ placeholder := BlObjectProperty on: self named: #placeholder ]