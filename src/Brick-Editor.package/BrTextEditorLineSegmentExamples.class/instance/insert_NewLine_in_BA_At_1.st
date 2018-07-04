examples - insertion
insert_NewLine_in_BA_At_1
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_B_in_A_at_0.
	
	aTextEditor insertString: String cr at: 1.

	self assert: aTextEditor text asString equals: 'B', String cr, 'A'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 1).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'B'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (2 to: 3).
	self assert: aTextEditor segmentCollector segments second text asString equals: 'A'.

	^ aTextEditor