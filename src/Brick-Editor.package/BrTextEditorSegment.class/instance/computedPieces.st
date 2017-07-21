pieces - computation
computedPieces
	pieces := Array streamContents: [ :aStream |
		| segmentIterator |
		segmentIterator := segment iterator.
	
		[ segmentIterator hasNext ] whileTrue: [ 
			aStream nextPut: segmentIterator nextWord ] ].
	
	pieces ifEmpty: [
		pieces := { BrRopedText string: '' } ].
	
	^ pieces