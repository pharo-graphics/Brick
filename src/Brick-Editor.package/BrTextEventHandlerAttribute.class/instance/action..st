accessing
action: aBlock
	self 
		assert: [ aBlock notNil ] 
		description: [ 'Action should be initialized' ].
	action := aBlock