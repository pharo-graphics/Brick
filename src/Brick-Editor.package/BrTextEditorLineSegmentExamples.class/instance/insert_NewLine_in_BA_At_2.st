insertion
insert_NewLine_in_BA_At_2
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_B_in_A_at_0.
	
	aTextEditor insertString: String cr at: 2.

	self assert: aTextEditor text asString equals: 'BA', String cr.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'BA'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (3 to: 3).
	self assert: aTextEditor segmentCollector segments second text asString equals: String cr.

	^ aTextEditor