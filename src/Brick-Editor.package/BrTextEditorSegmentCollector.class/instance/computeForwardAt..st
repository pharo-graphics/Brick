cache - computation
computeForwardAt: anIndex
	| intervalEnd cachedInterval actualStart skip forwardText stream builder  |

	"the index of the last already cached segment"
	intervalEnd := interval last.

	"indices interval of segments that we expect to cache in the end"
	cachedInterval := self computeInterval: anIndex.

	"new cached interval may overlap with existing cache, take it into account
	by computing an actual cache start index of a segment"
	actualStart := cachedInterval first max: (intervalEnd + 1).
	
	"a collection in which we will cache segments"
	segments := self forwardSegments: cachedInterval.

	skip := actualStart - (intervalEnd + 1).

	forwardText := self forwardText.
	stream := BrEditorSegmentStream new.
	stream skip: skip.
	stream limit: self cacheLimit - skip.
	builder := self editor segmentBuilder.
	
	builder split: forwardText in: stream.
	
	segments addAll: stream collection.
	interval := cachedInterval first to: cachedInterval first + stream size - 1.
	
	self computeSegmentIndices.
	self computeSubText