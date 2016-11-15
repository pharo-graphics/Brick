accessing properties
blockIncrementProperty
	^ blockIncrement
		ifNil: [ blockIncrement := BlObjectProperty on: self named: #blockIncrement default: 10 ]