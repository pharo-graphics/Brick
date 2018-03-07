accessing properties
iconProperty
	^ icon ifNil: [ icon := BlObjectProperty on: self named: #icon]