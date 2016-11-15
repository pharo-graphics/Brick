accessing properties
fontColorProperty
	^ fontColor ifNil: [ fontColor := BlObjectProperty on: self named: #fontColor default: Color veryDarkGray ]