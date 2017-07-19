accessing
character: aCharacter
	self
		assert: [ aCharacter isLineBreak not ]
		description: [ 'Character must not be a line break (it should be handled separately)' ].

	self
		assert: [ aCharacter isSeparator ]
		description: [ 'Character must be a separator' ].

	character := aCharacter