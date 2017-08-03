executing
executeOn: aTextEditor
	aTextEditor collector
		cachedSegmentAt: aTextEditor cursor position
		ifFound: [ :aSegment | aTextEditor notifyItemsChanged: (aSegment index to: aSegment index) ]
		ifNotFound: [  ].

	aTextEditor cursor position: self position.

	aTextEditor collector
		cachedSegmentAt: self position
		ifFound: [ :aSegment | aTextEditor notifyItemsChanged: (aSegment index to: aSegment index) ]
		ifNotFound: [  ]