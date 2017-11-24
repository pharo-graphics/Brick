insertion
insert_B_in_A_at_0
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_A_inEmptyAt_0.
	
	aTextEditor insertString: 'B' at: 0.

	self assert: aTextEditor text asString equals: 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (1 to: 2).

	^ aTextEditor