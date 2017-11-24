insertion
insert_NewLine_in_HABA_At_1
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_HABA_inEmptyAt_0.

	aTextEditor insertString: String cr at: 1.

	self assert: aTextEditor text asString equals: 'H', String cr, 'ABA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (1 to: 1).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (3 to: 5).

	^ aTextEditor