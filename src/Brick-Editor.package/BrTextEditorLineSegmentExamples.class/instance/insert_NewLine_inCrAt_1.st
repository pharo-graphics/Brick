insertion
insert_NewLine_inCrAt_1
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_inEmptyAt_0.

	aTextEditor insertString: String cr at: 1.

	self assert: aTextEditor text asString equals: String cr, String cr.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 3.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (1 to: 1).
	self assert: aTextEditor segmentCollector segments third textInterval equals: (2 to: 2).

	^ aTextEditor