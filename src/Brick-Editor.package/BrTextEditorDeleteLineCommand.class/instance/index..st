accessing
index: aNumber
	self
		assert: [ aNumber > 0 ]
		description: [ 'Deletion index must be positive' ].
		
	index := aNumber