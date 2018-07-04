examples - insertion
insert_A_in_HACrBA_At_3
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_HABA_At_2.

	aTextEditor insertString: 'A' at: 3.

	self assert: aTextEditor text asString equals: 'HA', String cr, 'ABA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'HA'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (3 to: 6).
	self assert: aTextEditor segmentCollector segments second text asString equals: 'ABA'.

	^ aTextEditor