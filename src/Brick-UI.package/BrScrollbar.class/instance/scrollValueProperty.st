accessing properties
scrollValueProperty
	^ scrollValue 
		ifNil: [ scrollValue := BlObjectProperty on: self named: #scrollValue default:0 ]