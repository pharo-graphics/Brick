testing
hasSegmentValue: aBrText at: anIndex iterator: anBrTextIterator
	"Since we get an iterator we can ask it directly whether there are more lines"
	<return: #Boolean>

	^ replacedSegments isNotEmpty or: [ anBrTextIterator hasNext ]