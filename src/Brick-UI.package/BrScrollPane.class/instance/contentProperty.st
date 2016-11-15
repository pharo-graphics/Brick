accessing properties
contentProperty
	^ content ifNil: [ content := BlObjectProperty on: self named: #content default:BlElement new ]