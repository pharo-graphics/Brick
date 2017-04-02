invalidation
rebuildSegments: aDisplayedValue of: anEditorBuilder

	anEditorBuilder
		segmentsCollect: [ :aSegment :aValue | aSegment items: (anEditorBuilder segmentItems: aValue) from: anEditorBuilder for: aValue ]
		displayedValue: aDisplayedValue
		in: collector.	
	interval := 1 to: collector segments size