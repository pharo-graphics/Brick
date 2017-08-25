insertion
insert_A_inEmptyAt_0_: aTextEditor
	<gtExample>
	<dependsOn: #editor:segmentBuilder:>
	
	aTextEditor insertString: 'A' at: 0.
	
	self assert: aTextEditor text asString equals: 'A'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (1 to: 1).

	^ aTextEditor