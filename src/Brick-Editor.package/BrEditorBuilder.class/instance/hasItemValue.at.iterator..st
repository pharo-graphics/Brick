values - accessing
hasItemValue: aSegmentValue at: anIndex iterator: anIterator
	"Return true if a given segment value has an item that corresponds to a provided position.
	Optionally (advanced), an iterator can be used (often #hasNext)"
	<return: #Boolean>

	^ self subclassResponsibility