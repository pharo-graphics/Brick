text - cursor
moveCursorTo: aTextIndex

	self cursor position = aTextIndex
		ifTrue: [ ^ self ].

	self cursor position: aTextIndex.

	self collector
		cachedSegmentAt: aTextIndex
		ifFound: [ :aSegment | self notifyItemsChanged: (aSegment index to: aSegment index) ]
		ifNotFound: [  ]