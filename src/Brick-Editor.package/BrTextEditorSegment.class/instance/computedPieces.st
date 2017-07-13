pieces - computation
computedPieces
	| segmentIterator |

	pieces := self newPieces.
	segmentIterator := segment iterator.
	
	[ segmentIterator hasNext ] whileTrue: [ 
		pieces add: segmentIterator nextWord ].
	
	^ pieces