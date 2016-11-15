accessing properties
titleProperty
	^ title ifNil: [title := BlObjectProperty on: self named: #title default: 'New Window' ]