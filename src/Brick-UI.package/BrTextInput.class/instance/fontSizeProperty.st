accessing properties
fontSizeProperty
	^ fontSize ifNil: [ fontSize := BlObjectProperty on: self named: #fontSize default: 10 ]