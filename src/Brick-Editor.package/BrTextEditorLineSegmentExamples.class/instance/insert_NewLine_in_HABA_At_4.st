insertion
insert_NewLine_in_HABA_At_4
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_HABA_inEmptyAt_0.

	aTextEditor insertString: String cr at: 4.

	self assert: aTextEditor text asString equals: 'HABA', String cr.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (1 to: 4).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (5 to: 5).

	^ aTextEditor