accessing properties
resizableProperty
	^ resizable ifNil: [ resizable := BlObjectProperty on: self named: #resizable default: true ]