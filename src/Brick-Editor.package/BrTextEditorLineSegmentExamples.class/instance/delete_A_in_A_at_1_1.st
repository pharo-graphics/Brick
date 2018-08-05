examples - deletion
delete_A_in_A_at_1_1
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_A_inEmptyAt_0.

	aTextEditor delete: 0 to: 1.

	self assert: aTextEditor text asString equals: ''.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).

	^ aTextEditor