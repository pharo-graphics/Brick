invalidation
rebuildSegment: aSegment of: anEditorBuilder
	"Rebuild items of a given segment for provided builder"

	 aSegment
		items: (anEditorBuilder segmentItems: (aSegment segmentValueAt: anEditorBuilder))
		from: anEditorBuilder
		for: (aSegment segmentValueAt: anEditorBuilder)