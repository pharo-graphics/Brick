examples - segments
segment_in_HACrCrLfBA_at_8
	<gtExample>
	| aTextEditor aSegment |
	
	aTextEditor := self insert_NewLineCrLf_in_HACrBA_At_3.
	
	aTextEditor segmentCollector
		cachedSegmentAt: 8
		ifFound: [ :aFoundSegment | aSegment := aFoundSegment ]
		ifNotFound: [].

	self assert: aSegment index equals: 3.

	^ aTextEditor