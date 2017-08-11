executing
executeOn: aTextEditor
	aTextEditor segmentCollector
		cachedSegmentAt: self index
		ifFound: [ :aSegment |
			| previousSegment |
			
			aTextEditor text
				delete: self index
				to: self index.

			previousSegment := aTextEditor segmentCollector cachedAt: aSegment index - 1.

			"merge two segments in one"
			previousSegment initializeWith: (aTextEditor text from: previousSegment textStart to: aSegment textEnd - 1).
			previousSegment invalidate.
			
			aTextEditor segmentCollector
				removeSegments: 1
				after: previousSegment.

			"move all segments after the one in which text was inserted"
			aTextEditor segmentCollector moveTextBy: -1 after: previousSegment.
	
			aTextEditor notifyItemsChanged: (previousSegment index to: previousSegment index).
			aTextEditor notifyItemsRemoved: (aSegment index to: aSegment index)
		]
		ifNotFound: [ self shouldBeImplemented ]