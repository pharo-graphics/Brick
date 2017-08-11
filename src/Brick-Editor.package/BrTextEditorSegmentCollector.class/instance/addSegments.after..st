cache - adding / removing
addSegments: aNumberOfSegments after: aSegment

	aNumberOfSegments timesRepeat: [
		self segments
			add: self newSegment
			afterIndex: aSegment index ].

	self segments
		withIndexDo: [ :eachSegment :anIndex | eachSegment index: anIndex ].
		
	interval := (interval first to: interval last + aNumberOfSegments)