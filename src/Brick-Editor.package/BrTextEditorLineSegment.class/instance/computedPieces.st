pieces - computation
computedPieces
	pieces := Array streamContents: [ :aStream |
		| segmentIterator |
		segmentIterator := self text iterator.
	
		[ segmentIterator hasNext ] whileTrue: [ 
			aStream nextPut: segmentIterator nextWord ] ].
	
	pieces ifEmpty: [
		pieces := { self text from: 0 to: 0 } ].

	^ pieces