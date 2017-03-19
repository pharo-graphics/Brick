builder - segments
segmentsIn: aSegmentCollector for: aSubject
	"Every builder is responsible for segment creation and addition them to a segment collector.
	Before adding a new segment users should check whether collector #wantMore of them.
	Segments can contain one or more items"

	^ self subclassResponsibility