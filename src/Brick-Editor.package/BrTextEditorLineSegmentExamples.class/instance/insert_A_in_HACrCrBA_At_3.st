insertion
insert_A_in_HACrCrBA_At_3
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_HACrBA_At_3.

	aTextEditor insertString: 'A' at: 3.

	self assert: aTextEditor text asString equals: 'HA', String cr, 'A', String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 3.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'HA'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (3 to: 4).
	self assert: aTextEditor segmentCollector segments second text asString equals: 'A'.
	self assert: aTextEditor segmentCollector segments third textInterval equals: (5 to: 7).
	self assert: aTextEditor segmentCollector segments third text asString equals: 'BA'.

	^ aTextEditor