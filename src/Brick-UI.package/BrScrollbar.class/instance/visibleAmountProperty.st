accessing properties
visibleAmountProperty
	^ visibleAmount
		ifNil: [ visibleAmount := BlObjectProperty on: self named: #visibleAmount default: 15 ]