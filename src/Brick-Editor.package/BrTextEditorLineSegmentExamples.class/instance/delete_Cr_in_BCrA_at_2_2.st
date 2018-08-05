examples - deletion
delete_Cr_in_BCrA_at_2_2
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_BA_At_1.

	aTextEditor delete: 1 to: 2.

	self assert: aTextEditor text asString equals: 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).

	^ aTextEditor