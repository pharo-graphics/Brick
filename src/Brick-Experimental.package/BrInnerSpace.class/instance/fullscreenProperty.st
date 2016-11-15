accessing properties
fullscreenProperty
	^ fullscreen ifNil: [ fullscreen := BlObjectProperty on: self named: #fullscreen default: false ]