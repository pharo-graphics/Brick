cache - adding / removing
removeSegmentInterval: anInterval
	"Remove all segments within index interval"

	anInterval reverseDo: [ :anIndex | self segments removeAt: anIndex ].
	
	self segments
		withIndexDo: [ :eachSegment :anIndex | eachSegment index: anIndex ].
	
	interval := (interval first to: interval last - 1).

	self editor notifyItemsRemoved: anInterval