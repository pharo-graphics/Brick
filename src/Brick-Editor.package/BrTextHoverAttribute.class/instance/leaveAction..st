accessing
leaveAction: aBlock
	self 
		assert: [ aBlock notNil ] 
		description: [ 'Leave action should be initialized' ].
	leaveAction := aBlock