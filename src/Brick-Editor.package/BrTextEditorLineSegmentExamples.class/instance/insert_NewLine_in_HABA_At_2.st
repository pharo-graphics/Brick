insertion
insert_NewLine_in_HABA_At_2
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_HABA_inEmptyAt_0.

	aTextEditor insertString: String cr at: 2.

	self assert: aTextEditor text asString equals: 'HA', String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (1 to: 2).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (4 to: 5).

	^ aTextEditor