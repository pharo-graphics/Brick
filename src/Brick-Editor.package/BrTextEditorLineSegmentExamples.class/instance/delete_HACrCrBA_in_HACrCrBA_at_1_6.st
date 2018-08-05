examples - deletion
delete_HACrCrBA_in_HACrCrBA_at_1_6
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_HACrBA_At_2.

	aTextEditor delete: 0 to: 6.

	self assert: aTextEditor text asString equals: ''.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).

	^ aTextEditor