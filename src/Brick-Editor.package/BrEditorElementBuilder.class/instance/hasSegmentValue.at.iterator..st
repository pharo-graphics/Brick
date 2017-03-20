values - accessing
hasSegmentValue: aDisplayedValue at: anIndex iterator: anIterator
	"Return true if a given displayed value has a segment that corresponds to a provided position.
	Optionally (advanced), an iterator can be used (often #hasNext)"
	<return: #Boolean>

	^ anIndex = 1