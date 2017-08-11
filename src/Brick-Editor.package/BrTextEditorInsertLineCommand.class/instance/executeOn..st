executing
executeOn: aTextEditor

	aTextEditor segmentCollector
		cachedSegmentAt: self index
		ifFound: [ :aSegment |
			| nextSegment aString |
			aString := self character asString.

			aTextEditor text
				insertString: aString
				at: self index.

			aTextEditor segmentCollector
				addSegments: 1
				after: aSegment.

			nextSegment := aTextEditor segmentCollector cachedAt: aSegment index + 1.
			nextSegment segment: (aTextEditor text from: self index + 2 to: aSegment textEnd + 1).

			aSegment segment: (aTextEditor text from: aSegment start to: self index).
			aSegment invalidate.

			"move all segments after the one in which text was inserted"
			aTextEditor segmentCollector moveTextBy: 1 after: nextSegment.
	
			aTextEditor notifyItemsChanged: (aSegment index to: aSegment index).
			aTextEditor notifyItemsInserted: (nextSegment index to: nextSegment index) ]
		ifNotFound: [ self shouldBeImplemented ].