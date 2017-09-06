pieces - computation
nextAdornment: aBrTextIterator
	<return: #BrSubText>

	^  aBrTextIterator nextSegment: [ :aCharacter | (aBrTextIterator selectAttributes: #isAdornment) ]