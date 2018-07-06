pieces - computation
nextWord: aBrTextIterator
	<return: #BlSubText>

	^  aBrTextIterator nextSegment: [ :aCharacter | self itemValueType: aCharacter ]