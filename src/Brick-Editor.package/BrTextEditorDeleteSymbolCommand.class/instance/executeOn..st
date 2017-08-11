executing
executeOn: aTextEditor
	aTextEditor segmentCollector
		cachedSegmentAt: self index
		ifFound: [ :aSegment |
			aTextEditor text
				delete: self index
				to: self index.

			aSegment invalidate.
			aSegment moveTextBy: -1 after: self index.
			
			aTextEditor segmentCollector moveTextBy: -1 after: aSegment.
			aTextEditor notifyItemsChanged: (aSegment index to: aSegment index)
		]
		ifNotFound: [ self shouldBeImplemented ]