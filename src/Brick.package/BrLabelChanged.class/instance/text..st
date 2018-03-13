accessing
text: aBrTextOrString
	self
		assert: [ aBrTextOrString isNotNil ]
		description: [ 'Text must not be nil' ].

	text := aBrTextOrString