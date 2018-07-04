examples - segments
segment_in_Empty_at_1
	<gtExample>
	| aTextEditor aSegment |
	
	aTextEditor := self emptyEditor.
	
	aTextEditor segmentCollector
		cachedSegmentAt: 0
		ifFound: [ :aFoundSegment | aSegment := aFoundSegment ]
		ifNotFound: [].

	self assert: aSegment index equals: 1.

	^ aTextEditor