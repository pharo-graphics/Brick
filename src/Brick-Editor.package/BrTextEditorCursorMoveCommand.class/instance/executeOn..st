executing
executeOn: aTextEditor
	aTextEditor segmentCollector
		cachedSegmentAt: aTextEditor cursor position
		ifFound: [ :aSegment | aTextEditor notifyItemsChanged: (aSegment index to: aSegment index) ]
		ifNotFound: [  ].

	aTextEditor cursor position: self position.

	aTextEditor segmentCollector
		cachedSegmentAt: self position
		ifFound: [ :aSegment | aTextEditor notifyItemsChanged: (aSegment index to: aSegment index) ]
		ifNotFound: [  ]