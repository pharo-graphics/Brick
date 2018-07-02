insertion
insert_NewLine_in_Hello_At_2
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_Hello_inEmptyAt_0.

	aTextEditor insertString: String cr at: 2.

	self assert: aTextEditor text asString equals: 'He', String cr, 'llo'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'He'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (3 to: 6).
	self assert: aTextEditor segmentCollector segments second text asString equals: 'llo'.

	^ aTextEditor