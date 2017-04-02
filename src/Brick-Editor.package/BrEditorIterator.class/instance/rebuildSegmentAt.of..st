invalidation
rebuildSegmentAt: anIndex of: anEditorBuilder
	"Rebuild items of a segment at a given index for provided builder.
	If segment is not within current collector, do nothing"

	(self isCachedAt: anIndex)
		ifTrue: [ self rebuildSegment: (self segmentAt: anIndex) of: anEditorBuilder ]