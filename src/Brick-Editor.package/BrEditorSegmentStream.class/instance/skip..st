accessing
skip: aNumber

	self
		assert: [ aNumber isInteger ]
		description: [ 'Skip count must be integer' ].

	skip := aNumber