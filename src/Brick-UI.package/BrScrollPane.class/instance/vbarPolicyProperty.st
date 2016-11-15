accessing properties
vbarPolicyProperty
	^ vbarPolicy ifNil: [ vbarPolicy := BlObjectProperty on: self named: #vbarPolicy default: self defaultBarPolicy ]