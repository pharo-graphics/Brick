accessing
character: aCharacter
	self
		assert: [ aCharacter isLineBreak not ]
		description: [ 'Character must not be a line break (it should be handled separately)' ].

	self
		assert: [ aCharacter isSeparator not ]
		description: [ 'Character must not be a separator (it should be handled separately)' ].
	
	character := aCharacter