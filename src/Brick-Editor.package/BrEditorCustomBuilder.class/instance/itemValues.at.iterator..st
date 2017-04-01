values - accessing
itemValues: aSegmentValue at: anIndex iterator: anIterator
	^ itemValueBlock cull: aSegmentValue cull: anIndex cull: anIterator