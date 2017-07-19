text - insert
insertString: aString in: aTextEditor
	self
		assert: [ aString size > 1 ]
		description: [ 'Single character insertions must be handled separately' ].
		
	self shouldBeImplemented