text - modifications
offsetSegmentIndicesBy: anOffset after: aSegmentIndex
	"Offset segments' #index by anOffset of all segments after a given segment index.
	Note: #lastIndex is not valid during execution of this method!"
	
	self
		assert: [ aSegmentIndex + 1 >= self firstIndex ]
		description: [ 'Segment index must be greater or equal first segment index ' ].
		
	(aSegmentIndex + 1 to: self segments size + self firstIndex - 1) do: [ :anIndex |
		| aSegment |
		
		aSegment := self segments at: anIndex - self firstIndex + 1.
		aSegment index: aSegment index + anOffset ].
	
	"actual cached interval changed, update it"
	interval := interval first to: interval last + anOffset