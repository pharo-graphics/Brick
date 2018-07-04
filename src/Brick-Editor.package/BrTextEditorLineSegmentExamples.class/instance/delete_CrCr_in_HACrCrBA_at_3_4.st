examples - deletion
delete_CrCr_in_HACrCrBA_at_3_4
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_HACrBA_At_2.

	aTextEditor delete: 3 to: 4.

	self assert: aTextEditor text asString equals: 'HABA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 4).

	^ aTextEditor