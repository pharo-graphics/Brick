executing
executeOn: aTextEditor
	| changedFrom changedTo |
	
	changedFrom := self fromIndex.
		
	changedTo := self toIndex.

	aTextEditor segmentsCollector
		cachedSegmentAt: changedFrom
		ifFound: [ :aSegment | changedFrom := aSegment index ]
		ifNotFound: [ 1 ].
	
	aTextEditor segmentsCollector
		cachedSegmentAt: changedTo
		ifFound: [ :aSegment | changedTo := aSegment index ]
		ifNotFound: [ changedTo := aTextEditor segmentsCollector segmentsCount].	

	aTextEditor notifyItemsChanged: (changedFrom to: changedTo)