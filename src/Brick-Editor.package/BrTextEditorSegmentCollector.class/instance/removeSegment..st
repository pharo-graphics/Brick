cache - adding / removing
removeSegment: aSegment
	"Remove a given segment"

	self segments removeAt: aSegment index.
	
	self segments
		withIndexDo: [ :eachSegment :anIndex | eachSegment index: anIndex ].
	
	interval := (interval first to: interval last - 1)