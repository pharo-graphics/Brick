pieces - computation
nextSegmentPiece: aBrTextIterator in: aStream
	aStream nextPut: (self textPiece: aBrTextIterator nextWord)