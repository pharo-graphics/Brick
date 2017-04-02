adding
insertedAt: anIndex itemCount: anItemCount
	segments values
		select: [ :aSegment | (anIndex between: aSegment start and: aSegment end) or: [ aSegment start >= anIndex ] ]
		thenDo: [ :aSegment |
			(anIndex between: aSegment start and: aSegment end)
				ifTrue: [ aSegment end: aSegment end + anItemCount ]
				ifFalse: [
					aSegment start: aSegment start + anItemCount.
					aSegment end: aSegment end + anItemCount ].
			aSegment insertedAt: anIndex itemCount: anItemCount ]