executing
executeOn: aTextEditor
	aTextEditor collector
		cachedSegmentAt: self index
		ifFound: [ :aSegment |
			| previousSegment |
			
			aTextEditor text
				delete: self index
				to: self index.

			previousSegment := aTextEditor collector cachedAt: aSegment index - 1.
			
			"merge two segments in one"
			previousSegment segment: (aTextEditor text from: previousSegment start to: aSegment end - 1).
			previousSegment invalidate.
			
			aTextEditor collector
				removeSegments: 1
				after: previousSegment.

			"move all segments after the one in which text was inserted"
			aTextEditor collector moveTextBy: -1 after: previousSegment.
	
			aTextEditor notifyItemsChanged: (previousSegment index to: previousSegment index).
			aTextEditor notifyItemsRemoved: (aSegment index to: aSegment index)
		]
		ifNotFound: [ self shouldBeImplemented ]