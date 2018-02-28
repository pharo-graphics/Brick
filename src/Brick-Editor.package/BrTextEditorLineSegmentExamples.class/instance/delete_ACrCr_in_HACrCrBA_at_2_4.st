deletion
delete_ACrCr_in_HACrCrBA_at_2_4
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_HACrBA_At_2.

	aTextEditor delete: 2 to: 4.

	self assert: aTextEditor text asString equals: 'HBA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (1 to: 3).

	^ aTextEditor