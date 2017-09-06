pieces - computation
nextWord: aBrTextIterator with: aCollectionOfInitialAttributes
	<return: #BrSubText>

	^  aBrTextIterator nextSegment: [ :aCharacter |		
			aCollectionOfInitialAttributes = (aBrTextIterator selectAttributes: #isAdornment)
				ifTrue: [ self itemValueType: aCharacter ]
				ifFalse: [ #different ] ]