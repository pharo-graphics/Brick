accessing
listElement: aListWidgetElement
	self 
		assert: [ aListWidgetElement isNotNil ]
		description: [ 'List must not be nil' ].

	listElement := aListWidgetElement