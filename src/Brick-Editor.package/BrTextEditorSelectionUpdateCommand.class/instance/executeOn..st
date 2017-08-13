executing
executeOn: aTextEditor
	| changedFrom changedTo |
	
	changedFrom := self fromIndex.
		
	changedTo := self toIndex.

	aTextEditor segmentCollector
		cachedSegmentAt: changedFrom
		ifFound: [ :aSegment | changedFrom := aSegment index ]
		ifNotFound: [ 1 ].

	aTextEditor segmentCollector
		cachedSegmentAt: changedTo
		ifFound: [ :aSegment | changedTo := aSegment index ]
		ifNotFound: [ changedTo := aTextEditor segmentCollector segmentsCount].	

	aTextEditor
		notifyItemsChanged: (changedFrom to: changedTo)
		payload: self newHolderCommand