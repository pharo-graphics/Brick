accessing
icon: anElement
	self
		assert: [ anElement isNotNil ]
		description: [ 'Icon must not be nil' ].

	iconElement := anElement.
	self updateIcon