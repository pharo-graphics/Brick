accessing
shape: aBlock

	self
		assert: [ aBlock isNotNil ]
		description: [ 'Shape block must not be nil' ].

	shapeBlock := aBlock