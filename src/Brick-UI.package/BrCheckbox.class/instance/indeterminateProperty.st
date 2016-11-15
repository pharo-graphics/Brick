accessing
indeterminateProperty
	^ indeterminate ifNil: [ indeterminate := BlObjectProperty on: self named: #indeterminate default: false ]