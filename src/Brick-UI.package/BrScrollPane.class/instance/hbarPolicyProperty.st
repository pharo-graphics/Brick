accessing properties
hbarPolicyProperty
	^ hbarPolicy ifNil: [ hbarPolicy := BlObjectProperty on: self named: #hbarPolicy default: self defaultBarPolicy ]