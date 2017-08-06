text - insert
insertCharacter: aCharacter in: aTextEditor
			
	aCharacter isLineBreak
		ifTrue: [ ^ self insertLine: aCharacter in: aTextEditor ].
		
	aCharacter isSeparator
		ifTrue: [ ^ self insertSeparator: aCharacter in: aTextEditor ].
		
	self insertSymbol: aCharacter in: aTextEditor