insertion
insert_NewLine_in_HABA_At_0
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_HABA_inEmptyAt_0.

	aTextEditor insertString: String cr at: 0.

	self assert: aTextEditor text asString equals: String cr, 'HABA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (2 to: 5).

	^ aTextEditor