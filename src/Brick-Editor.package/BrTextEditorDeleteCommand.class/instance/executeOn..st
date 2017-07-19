executing
executeOn: aTextEditor
	"when deleting an interval of >1 text items it is quite complicated to optimize,
	we will come back to it it later when selection works"
	self fromIndex = self toIndex
		ifFalse: [ self shouldBeImplemented ].

	aTextEditor collector
		cachedSegmentAt: self fromIndex
		ifFound: [ :aSegment |
			aTextEditor text
				delete: self fromIndex
				to: self toIndex.
			aSegment invalidate.
			aTextEditor notifyItemsChanged: (aSegment index to: aSegment index).
		]
		ifNotFound: [ self shouldBeImplemented ]