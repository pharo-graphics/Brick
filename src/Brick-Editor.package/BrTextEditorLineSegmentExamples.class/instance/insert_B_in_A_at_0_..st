insertion
insert_B_in_A_at_0_: aTextEditor
	<gtExample>
	<dependsOn: #insert_A_inEmptyAt_0_:>
	
	aTextEditor insertString: 'B' at: 0.

	self assert: aTextEditor text asString equals: 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (1 to: 2).

	^ aTextEditor