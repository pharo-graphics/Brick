values - accessing
hasSegmentValue: aDisplayedValue at: anIndex iterator: anIterator
	^ hasSegmentValueBlock cull: aDisplayedValue cull: anIndex cull: anIterator