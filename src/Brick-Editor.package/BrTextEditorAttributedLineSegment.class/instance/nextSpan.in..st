pieces - computation
nextSpan: aBrTextIterator in: aStream
	| aSpanText |
	
	aSpanText := aBrTextIterator nextSegment: [ :aCharacter | aBrTextIterator selectAttributes: #isEventHandler ].
	aStream nextPut: (self textPiece: aSpanText)