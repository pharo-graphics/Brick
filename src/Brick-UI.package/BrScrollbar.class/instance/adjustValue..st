accessing
adjustValue: aPosition
	| posValue newValue |
	newValue := self scrollValue.
	posValue := (aPosition min: 1 max: 0) * (self max - self min).
	
	posValue > self scrollValue
		ifTrue: [ newValue := self scrollValue + self blockIncrement ].
	posValue < self scrollValue
		ifTrue: [ newValue := self scrollValue - self blockIncrement ].
	

	self scrollValue: (newValue min: self max max: self min)