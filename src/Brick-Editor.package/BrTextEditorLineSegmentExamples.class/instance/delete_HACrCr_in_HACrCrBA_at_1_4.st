examples - deletion
delete_HACrCr_in_HACrCrBA_at_1_4
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_HACrBA_At_2.

	aTextEditor delete: 0 to: 4.

	self assert: aTextEditor text asString equals: 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).

	^ aTextEditor