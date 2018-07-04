examples - segments
segment_in_HACrCrLfBA_at_2
	<gtExample>
	| aTextEditor aSegment |
	
	aTextEditor := self insert_NewLineCrLf_in_HACrBA_At_3.
	
	aTextEditor segmentCollector
		cachedSegmentAt: 2
		ifFound: [ :aFoundSegment | aSegment := aFoundSegment ]
		ifNotFound: [].

	self assert: aSegment index equals: 1.

	^ aTextEditor