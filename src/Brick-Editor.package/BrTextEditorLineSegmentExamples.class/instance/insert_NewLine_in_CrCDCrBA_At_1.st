insertion
insert_NewLine_in_CrCDCrBA_At_1
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_CDCrBA_At_0.

	aTextEditor insertString: String cr at: 1.

	self assert: aTextEditor text asString equals: String cr, String cr, 'CD', String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 4.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments first text asString equals: ''.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (1 to: 1).
	self assert: aTextEditor segmentCollector segments second text asString equals: String cr.
	self assert: aTextEditor segmentCollector segments third textInterval equals: (2 to: 4).
	self assert: aTextEditor segmentCollector segments third text asString equals: 'CD'.
	self assert: aTextEditor segmentCollector segments fourth textInterval equals: (5 to: 7).
	self assert: aTextEditor segmentCollector segments fourth text asString equals: 'BA'.

	^ aTextEditor