executing
executeOn: aTextEditor
	| changedFrom changedTo |
	
	changedFrom := aTextEditor hasSelection
		ifTrue: [ self fromIndex min: aTextEditor selection from ]
		ifFalse: [ self fromIndex ].
		
	changedTo := aTextEditor hasSelection
		ifTrue: [ self toIndex max: aTextEditor selection to ]
		ifFalse: [ self toIndex ].

	aTextEditor collector
		cachedSegmentAt: changedFrom
		ifFound: [ :aSegment | changedFrom := aSegment index ]
		ifNotFound: [ 1 ].
	
	aTextEditor collector
		cachedSegmentAt: changedTo
		ifFound: [ :aSegment | changedTo := aSegment index ]
		ifNotFound: [ changedTo := aTextEditor collector segmentsCount].

	aTextEditor selection from: self fromIndex to: self toIndex.
	aTextEditor notifyItemsChanged: (changedFrom to: changedTo)