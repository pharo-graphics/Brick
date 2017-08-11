cache - adding / removing
removeSegments: aNumberOfSegments after: aSegment

	aSegment index + aNumberOfSegments to: aSegment index + 1 by: -1 do: [ :anIndex |
		(self cachedAt: anIndex) invalidate.
		self segments removeAt: anIndex ].
	
	self segments
		withIndexDo: [ :eachSegment :anIndex | eachSegment index: anIndex ].
	
	interval := (interval first to: interval last - aNumberOfSegments)