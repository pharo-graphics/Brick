values - accessing
itemValue: aSegmentValue at: anIndex iterator: anIterator
	^ itemValueBlock cull: aSegmentValue cull: anIndex cull: anIterator