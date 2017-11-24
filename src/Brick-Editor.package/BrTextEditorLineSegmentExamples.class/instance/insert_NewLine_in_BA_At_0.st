insertion
insert_NewLine_in_BA_At_0
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_B_in_A_at_0.
	
	aTextEditor insertString: String cr at: 0.

	self assert: aTextEditor text asString equals: String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (2 to: 3).

	^ aTextEditor