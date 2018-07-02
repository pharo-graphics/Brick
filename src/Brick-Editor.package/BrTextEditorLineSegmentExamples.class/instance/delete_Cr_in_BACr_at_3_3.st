deletion
delete_Cr_in_BACr_at_3_3
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_BA_At_2.

	aTextEditor delete: 3 to: 3.

	self assert: aTextEditor text asString equals: 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).

	^ aTextEditor