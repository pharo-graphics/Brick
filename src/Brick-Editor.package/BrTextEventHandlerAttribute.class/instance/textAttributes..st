accessing
textAttributes: aCollectionOfTextAttributes
	self 
		assert: [ aCollectionOfTextAttributes notNil ] 
		description: [ 'Text attributes have to be initialized' ].
	self action: [ :aText :anEventTarget :anEvent |
		aText attributes: aCollectionOfTextAttributes value ].