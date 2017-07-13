instance creation
onBindHolder: aSegmentHolder at: aPosition
	"I bind a segment at a given position to provided segment holder"
	| aSegment |

	"First we want to acquire a segment for a given position"
	aSegment := collector segmentAt: aPosition.
	"and than bind it to the holder"
	aSegmentHolder segment: aSegment