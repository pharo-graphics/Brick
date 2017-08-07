accessing
segmentBuilder: aTextSegmentBuilder
	"Change current segment builder to a new one and completely invalidate the structure"
	
	segmentBuilder := aTextSegmentBuilder.
	self notifyChanged