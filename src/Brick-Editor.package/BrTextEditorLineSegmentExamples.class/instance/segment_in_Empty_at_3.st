examples - segments
segment_in_Empty_at_3
	<gtExample>
	| aTextEditor aSegment |
	
	aTextEditor := self emptyEditor.
	
	aTextEditor segmentCollector
		cachedSegmentAt: 0
		ifFound: [ :aFoundSegment | aSegment := aFoundSegment ]
		ifNotFound: [].

	self assert: aSegment index equals: 1.

	^ aTextEditor