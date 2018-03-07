api - hooks
onInstalledIn: anElement
	super onInstalledIn: anElement.
	
	self
		assert: [ widget isNil ]
		description: [ 'Can not install the same look instance on multiple widgets' ].

	widget := anElement