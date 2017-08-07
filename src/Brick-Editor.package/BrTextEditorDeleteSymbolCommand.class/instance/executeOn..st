executing
executeOn: aTextEditor
	aTextEditor segmentsCollector
		cachedSegmentAt: self index
		ifFound: [ :aSegment |
			aTextEditor text
				delete: self index
				to: self index.

			aSegment invalidate.
			aSegment moveTextBy: -1 after: self index.
			
			aTextEditor segmentsCollector moveTextBy: -1 after: aSegment.
			aTextEditor notifyItemsChanged: (aSegment index to: aSegment index)
		]
		ifNotFound: [ self shouldBeImplemented ]