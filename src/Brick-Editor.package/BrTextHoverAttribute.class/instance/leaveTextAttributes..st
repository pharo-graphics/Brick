accessing
leaveTextAttributes: aCollectionOfTextAttributes
	self 
		assert: [ aCollectionOfTextAttributes notNil ] 
		description: [ 'Text attributes have to be initialized' ].
	self leaveAction: [ :aText :anEventTarget :anEvent |
		aText attributes: aCollectionOfTextAttributes value ].