builder - segments
segmentsIn: aSegmentCollector for: aSubject
	"Every builder is responsible for segment creation and addition them to the segment collector.
	Before adding a new segment users should check whether collector #wantsMore of them.
	Segments can contain one or more items"

	self
		segmentsCollect: [ :aSegment :aValue | aSegment items: (self segmentItems: aValue) from: self for: aValue ]
		of: aSubject
		in: aSegmentCollector