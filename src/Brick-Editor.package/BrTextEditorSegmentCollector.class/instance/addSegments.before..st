cache - adding / removing
addSegments: aCollectionOfSegments before: aSegment
	
	self
		assert: [ aCollectionOfSegments isNotEmpty ]
		description: [ 'Can not add a collection of empty segments!' ].
	
	self
		assert: [ self segments size = interval size ]
		description: [ 'Amount of segments must correspond to the interval' ].

	self
		assert: [
			| satisfy |
			satisfy := true.
			self segments with: interval do: [ :eachSegment :anExpectedIndex |
				satisfy := satisfy and: [ eachSegment index = anExpectedIndex ]	].
			satisfy ]
		description: [ 'Segment indices must correspond to the interval' ].

	aCollectionOfSegments withIndexDo: [ :aNewSegment :anIndex |
		aNewSegment index: (aSegment index - aCollectionOfSegments size) + anIndex.
		self segments
			add: aNewSegment
			afterIndex: aNewSegment index - 1 ].
	
	self offsetSegmentIndicesBy: aCollectionOfSegments size after: aCollectionOfSegments last index.
	
	self
		assert: [ self segments size = interval size ]
		description: [ 'Amount of segments must correspond to the interval' ].
		
	self
		assert: [
			| satisfy |
			satisfy := true.
			self segments with: interval do: [ :eachSegment :anExpectedIndex |
				satisfy := satisfy and: [ eachSegment index = anExpectedIndex ]	].
			satisfy ]
		description: [ 'Segment indices must correspond to the interval' ].