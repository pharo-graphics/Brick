accessing properties
wrapTextProperty
	^ wrapText ifNil: [ wrapText := BlObjectProperty on: self named: #wrapText default: false ]