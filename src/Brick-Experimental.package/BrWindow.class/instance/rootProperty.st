accessing properties
rootProperty
	^ root ifNil: [ root := BlObjectProperty on: self named: #root default: (BrPane new space: self) ]