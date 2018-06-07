pieces - computation
nextAdornment: aBrTextIterator
	<return: #BrSubText>

	^  aBrTextIterator nextSegment: [ :aCharacter |
			aBrTextIterator selectAttributes: [ :anAttribute |
				anAttribute isParagraphAttribute not
					and: [ anAttribute isAdornment ] ] ]