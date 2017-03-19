values - accessing
hasItemValue: aSegmentValue at: anIndex iterator: anIterator
	^ hasItemValueBlock cull: aSegmentValue cull: anIndex cull: anIterator