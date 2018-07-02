insertion
insert_haCrCrbaCr_inHelloAt_2
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_Hello_inEmptyAt_0.

	aTextEditor insertString: ('ha', String cr, String cr, 'ba', String cr) at: 2.

	self assert: aTextEditor text asString equals: 'He','ha', String cr, String cr, 'ba', String cr,'llo'.
	
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 4.
	
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 4).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'Heha'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (5 to: 5).
	self assert: aTextEditor segmentCollector segments second text asString equals: String cr.
	self assert: aTextEditor segmentCollector segments third textInterval equals: (6 to: 8).
	self assert: aTextEditor segmentCollector segments third text asString equals: 'ba'.
	self assert: aTextEditor segmentCollector segments fourth textInterval equals: (9 to: 12).
	self assert: aTextEditor segmentCollector segments fourth text asString equals: 'llo'.

	^ aTextEditor