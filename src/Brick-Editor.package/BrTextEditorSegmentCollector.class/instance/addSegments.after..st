cache - adding / removing
addSegments: aNumberOfSegments after: aSegment

	aNumberOfSegments timesRepeat: [
		self segments
			add: (self editor segmentBuilder newSegment: (BrSubText empty: (BrRopedText string: '')))
			afterIndex: aSegment index ].

	self segments
		withIndexDo: [ :eachSegment :anIndex | eachSegment index: anIndex ].
		
	interval := (interval first to: interval last + aNumberOfSegments)