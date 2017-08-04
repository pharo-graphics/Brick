executing
executeOn: aTextEditor
	| changedFrom changedTo |
	
	changedFrom := self fromIndex.
		
	changedTo := self toIndex.

	aTextEditor collector
		cachedSegmentAt: changedFrom
		ifFound: [ :aSegment | changedFrom := aSegment index ]
		ifNotFound: [ 1 ].
	
	aTextEditor collector
		cachedSegmentAt: changedTo
		ifFound: [ :aSegment | changedTo := aSegment index ]
		ifNotFound: [ changedTo := aTextEditor collector segmentsCount].	

	aTextEditor notifyItemsChanged: (changedFrom to: changedTo)