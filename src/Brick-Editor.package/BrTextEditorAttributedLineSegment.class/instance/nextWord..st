pieces - computation
nextWord: aBrTextIterator
	<return: #BrSubText>

	^  aBrTextIterator nextSegment: [ :aCharacter | self itemValueType: aCharacter ]