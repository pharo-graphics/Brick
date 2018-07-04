examples - deletion
delete_A_in_BA_at_2_2
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_B_in_A_at_0.
	
	aTextEditor delete: 2 to: 2.

	self assert: aTextEditor text asString equals: 'B'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 1).

	^ aTextEditor