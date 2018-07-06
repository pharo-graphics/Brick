pieces - computation
nextAdornment: aBrTextIterator
	<return: #BlSubText>

	^  aBrTextIterator nextSegment: [ :aCharacter |
			aBrTextIterator selectAttributes: [ :anAttribute |
				anAttribute isParagraphAttribute not
					and: [ anAttribute isAdornment ] ] ]