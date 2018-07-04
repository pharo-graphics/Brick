examples - deletion
delete_B_in_BA_at_1_1
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_B_in_A_at_0.
	
	aTextEditor delete: 1 to: 1.

	self assert: aTextEditor text asString equals: 'A'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 1).

	^ aTextEditor