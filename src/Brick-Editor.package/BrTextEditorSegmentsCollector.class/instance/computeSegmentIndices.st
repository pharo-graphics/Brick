private - computing
computeSegmentIndices
	"Recompute segment indices according to currently cached inerval"
	
	self
		assert: [ self hasCached ]
		description: [ 'There must be cached segments in order to compute sub text' ].
	
	self
		assert: [ segments size = interval size ]
		description: [ 'Cached segments interval must correspond to amount of segments' ].
		
	segments
		with: interval
		do: [ :aSegment :anIndex | aSegment index: anIndex ]