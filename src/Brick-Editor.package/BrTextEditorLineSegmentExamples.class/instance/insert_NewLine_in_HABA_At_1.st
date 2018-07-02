insertion
insert_NewLine_in_HABA_At_1
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_HABA_inEmptyAt_0.

	aTextEditor insertString: String cr at: 1.

	self assert: aTextEditor text asString equals: 'H', String cr, 'ABA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 1).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'H'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (2 to: 5).
	self assert: aTextEditor segmentCollector segments second text asString equals: 'ABA'.

	^ aTextEditor