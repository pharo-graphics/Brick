accessing
removableTextAttribute: aTextAttribute
	self 
		assert: [ aTextAttribute notNil ] 
		description: [ 'Text attribute has to be initialized' ].
	self removableTextAttributes: { aTextAttribute }