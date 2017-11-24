insertion
insert_A_in_HACrBA_At_3
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_HABA_At_2.

	aTextEditor insertString: 'A' at: 3.

	self assert: aTextEditor text asString equals: 'HA', String cr, 'ABA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (1 to: 2).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (4 to: 6).

	^ aTextEditor