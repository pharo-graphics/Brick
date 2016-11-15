accessing properties
highlightColorProperty
	^ highlightColor ifNil: [ highlightColor := BlObjectProperty on: self named: #highlightColor default: Color veryVeryLightGray  ]