deletion
delete_HACrCrB_in_HACrCrBA_at_1_5
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_HACrBA_At_2.

	aTextEditor delete: 1 to: 5.

	self assert: aTextEditor text asString equals: 'A'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 1).

	^ aTextEditor