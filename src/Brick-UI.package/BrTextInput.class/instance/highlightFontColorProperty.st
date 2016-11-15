accessing properties
highlightFontColorProperty
	^ highlightTextColor ifNil: [ highlightTextColor := BlObjectProperty on: self named: #highlightFontColor default: Color white ]