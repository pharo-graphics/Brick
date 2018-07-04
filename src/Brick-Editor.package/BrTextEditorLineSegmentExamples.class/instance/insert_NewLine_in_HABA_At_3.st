examples - insertion
insert_NewLine_in_HABA_At_3
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_HABA_inEmptyAt_0.

	aTextEditor insertString: String cr at: 3.

	self assert: aTextEditor text asString equals: 'HAB', String cr, 'A'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 3).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'HAB'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (4 to: 5).
	self assert: aTextEditor segmentCollector segments second text asString equals: 'A'.

	^ aTextEditor