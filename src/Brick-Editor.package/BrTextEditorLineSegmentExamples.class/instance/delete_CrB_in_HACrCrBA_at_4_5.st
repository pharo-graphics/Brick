deletion
delete_CrB_in_HACrCrBA_at_4_5
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_HACrBA_At_2.

	aTextEditor delete: 4 to: 5.

	self assert: aTextEditor text asString equals: 'HA', String cr, 'A'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (3 to: 4).
	^ aTextEditor