executing
executeOn: aTextEditor
	aTextEditor segmentsCollector
		cachedSegmentAt: aTextEditor cursor position
		ifFound: [ :aSegment | aTextEditor notifyItemsChanged: (aSegment index to: aSegment index) ]
		ifNotFound: [  ].

	aTextEditor cursor position: self position.

	aTextEditor segmentsCollector
		cachedSegmentAt: self position
		ifFound: [ :aSegment | aTextEditor notifyItemsChanged: (aSegment index to: aSegment index) ]
		ifNotFound: [  ]