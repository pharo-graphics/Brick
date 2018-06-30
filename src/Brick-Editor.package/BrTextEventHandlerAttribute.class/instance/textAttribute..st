accessing
textAttribute: aTextAttributes
	self 
		assert: [ aTextAttributes notNil ] 
		description: [ 'Text attribute has to be initialized' ].
	self textAttributes: { aTextAttributes }