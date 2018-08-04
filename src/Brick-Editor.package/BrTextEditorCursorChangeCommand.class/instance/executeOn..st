executing
executeOn: aTextEditor
	aTextEditor segmentCollector
		cachedSegmentAt: self position
		ifFound: [ :aSegment |
			aTextEditor
				notifyItemsChanged: (aSegment index to: aSegment index)
				payload: self newHolderCommand ]
		ifNotFound: [  ]