accessing
removableTextAttributes: aCollectionOfTextAttributes
	| theUsedAttributes |
	self 
		assert: [ aCollectionOfTextAttributes notNil ] 
		description: [ 'Text attributes have to be initialized' ].
	self action: [ :aText :anEventTarget :anEvent |
		aText attributes: (theUsedAttributes := aCollectionOfTextAttributes value) ].
	self leaveAction: [ :aText :anEventTarget :anEvent |
		theUsedAttributes ifNotNil: [ :anInstance |
			aText clearAttributes: [ :aTextAttribute | anInstance includes: aTextAttribute ] ] ].